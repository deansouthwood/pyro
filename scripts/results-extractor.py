import sys, getopt, os, glob, fnmatch, subprocess, errno, csv
import pandas as pd
import numpy as np

# Set current working directory
cwd = os.getcwd()

# Get arguments
all_arguments = sys.argv

# Get rid of file name arg
arg_list = all_arguments[1:]
num_arguments = len(arg_list)

# Set up command argument options for getopt
short_options = "a:h"
long_options = ["asm", "help"]

# Set help/usage string output
usage_str = "results-extractor.py Usage: \npython results-extractor.py -a <path/to/assembly.fa> ."

# Make sure arguments are valid
try:
    args, vals = getopt.getopt(arg_list, short_options, long_options)
except getopt.error as err:
    # Output error, return error code
    print ("Error: " + str(err))
    print (usage_str)
    sys.exit(2)

# Set some defaults
inpath = ""
asm = ""
tag = ""
tech = ""
group = ""
asm_dict = dict()
p1 = ""
r1 = ""
t1 = ""
p2 = ""
r2 = ""
t2 = ""

# Set or override some parameters from arguments
for cur_arg, cur_val in args:
    if cur_arg in ("-a", "--asm"):
        inpath = cur_val
    elif cur_arg in ("-h", "--help"):
        print (usage_str)
        sys.exit(2)

splitpath = inpath.split('/')

tech = splitpath[1]
asm = splitpath[2]
tag = splitpath[3][len(splitpath[2])+1:].split('.')[0]

if tag == "scaffold":
    group = "asm"
elif fnmatch.fnmatch(tag, "scaffold-short-*"):
    group = "short"
elif fnmatch.fnmatch(tag, "scaffold-long-*-short-*"):
    group = "long-short"
elif fnmatch.fnmatch(tag, "scaffold-long-*"):
    group = "long"
elif fnmatch.fnmatch(tag, "scaffold-hyb-*"):
    group = "hyb"

asm_split = asm.split('-')[1:]
asm_name = asm.split('-')[0]
for pt in asm_split:
    if pt in ["ill", "nano", "pacbio", "hyb"]:
        continue
    else:
        asm_name = asm_name + "-" + pt

if not tag == "scaffold":
    split_tag = tag.split('-')
    split_len = len(split_tag)
    if split_tag[1] == "short":
        t1 = "ill"
        p1 = split_tag[2]
        r1 = split_tag[3]
    elif split_tag[1] == "hyb":
        t1 = split_tag[3] + "-hyb"
        p1 = split_tag[2]
        r1 = split_tag[4]
    elif split_tag[1] == "long":
        t1 = split_tag[3]
        p1 = split_tag[2]
        r1 = split_tag[4]
        if split_len > 5:
            t2 = "ill"
            p2 = split_tag[6]
            r2 = split_tag[7]

asm_conv_dict = {
    "abyss-ill": "ABySS",
    "masurca-ill": "MaSuRCA",
    "meraculous-ill": "Meraculous",
    "platanus-ill": "Platanus",
    "ray-ill": "Ray",
    "soap-ill": "SOAPdenovo2",
    "spades-ill": "SPAdes",
    "sparse-dbg2olc-ill": "SparseAssembler",
    "w2rap-ill": "w2rap",
    "canu-nano": "Canu",
    "canu-fast-nano": "Canu-Fast",
    "flye-nano": "Flye",
    "miniasm-nano": "miniasm",
    "necat-nano": "NECAT",
    "raven-nano": "Raven",
    "shasta-nano": "Shasta",
    "wtdbg2-nano": "WTDBG2",
    "canu-pacbio": "Canu",
    "falcon-pacbio": "FALCON",
    "flye-pacbio": "Flye",
    "mecat2-pacbio": "MECAT2",
    "miniasm-pacbio": "miniasm",
    "raven-pacbio": "Raven",
    "wtdbg2-pacbio": "WTDBG2",
    "haslr-nano-hyb": "HASLR-Nano",
    "dbg2olc-pacbio-hyb": "DBG2OLC-PacBio",
    "haslr-pacbio-hyb": "HASLR-PacBio",
    "masurca-hyb": "MaSuRCA-Hybrid",
    "masurca-flye-hyb": "MaSuRCA-Flye-Hybrid",
    "spades-hyb": "SPAdes-Hybrid"
}

pol_conv_dict = {
    "short-gatk": "GATK",
    "short-hypo": "HyPo",
    "short-nextpolish": "NextPolish",
    "short-ntedit": "ntEdit",
    "short-pilon": "Pilon",
    "short-polca": "POLCA",
    "short-racon": "Racon",
    "long-medaka-nano": "Medaka",
    "long-medrac-nano": "Racon-Medaka",
    "long-nextpolish-nano": "NextPolish",
    "long-racon-nano": "Racon",
    "long-arrow-pacbio": "Arrow",
    "long-nextpolish-pacbio": "NextPolish",
    "long-racon-pacbio": "Racon",
    "long-nextpolish-comb": "NextPolish-Nano-PacBio",
    "long-medrac-comb": "Racon-Medaka-Nano-PacBio",
    "long-racon-comb": "Racon-Nano-PacBio",
    "hyb-hypo-nano": "HyPo-Nano",
    "hyb-hypo-pacbio": "HyPo-PacBio",
    "hyb-hypo-hyb": "HyPo-Hybrid"
}

asm_dict["asm"] = asm_name
asm_dict["tech"] = tech.lower()
asm_dict["pol-1"] = p1
asm_dict["poltech-1"] = t1
asm_dict["round-1"] = r1
asm_dict["pol-2"] = p2
asm_dict["poltech-2"] = t2
asm_dict["round-2"] = r2

####################################
## Process assembly-stats results ##
####################################

astatfile = "3-metrics/assembly-stats/{}/{}/{}-{}.txt".format(tech, asm, asm, tag)
gcfile = "3-metrics/assembly-stats/{}/{}/{}-{}-GC.txt".format(tech, asm, asm, tag)
if not os.path.isfile(astatfile):
    print ("No assembly-stats file found. Generating...")
    astat_cmd = "assembly-stats {}".format(inpath)
    os.makedirs(os.path.dirname(astatfile), exist_ok=True)
    with open(astatfile, "w+") as f:
        gen_astat = subprocess.run(astat_cmd, shell=True, stdout=f)

with open(astatfile, "r") as f:
    print ("Reading from assembly-stat file...")
    for line in f:
        if line in ['\n', '\r\n']:
            continue
        trigger = line.split()[0]
        if trigger == "sum":
            astat_bases = int(line.split()[2].rstrip(','))
            astat_no_frags = int(line.split()[5].rstrip(','))
            astat_avg = float(line.split()[8].rstrip(','))
            astat_longest = int(line.split()[11])
        elif trigger == "N50":
            astat_n50 = int(line.split()[2].rstrip(','))
            astat_l50 = int(line.split()[5])
        elif trigger == "N_count":
            astat_ns = int(line.split()[2])
        elif trigger == "Gaps":
            astat_gaps = int(line.split()[2])
    assembly_stats = [astat_bases, astat_no_frags, astat_avg, astat_longest, astat_n50, astat_l50, astat_ns, astat_gaps]

if not os.path.isfile(gcfile):
    print ("No GC stat file found. Generating...")
    gc_cmd = "scripts/calculate-gc.sh {}".format(inpath)
    os.makedirs(os.path.dirname(gcfile), exist_ok=True)
    with open(gcfile, "w+") as f:
        gen_gc = subprocess.run(gc_cmd, shell=True, stdout=f)

with open(gcfile, "r") as f:
    print ("Reading from GC stat file")
    for line in f:
        if line in ['\n', '\r\n']:
            continue
        gc_dec = line.strip()
        gc_pct = float(gc_dec.rstrip('\n'))*100

asm_dict["total-size"] = astat_bases
asm_dict["no-frags"] = astat_no_frags
asm_dict["avg-size"] = astat_avg
asm_dict["largest-size"] = astat_longest
asm_dict["n50"] = astat_n50
asm_dict["l50"] = astat_l50
asm_dict["no_ns"] = astat_ns
asm_dict["no_gaps"] = astat_gaps
asm_dict["gc_pct"] = gc_pct

#########################
## Process Red results ##
#########################

redfile = "3-metrics/red/{}/{}/{}-{}/{}-{}.txt".format(tech, asm, asm, tag, asm, tag) 
red_pct = ""
if os.path.isfile(redfile): 
    print ("Reading from Red file...")
    with open(redfile, "r") as f:
        red_pct = f.readlines()[-1].split("Repeats content: ")[-1].strip().rstrip("%")

asm_dict["repeats"] = red_pct

###########################
## Process BUSCO results ##
###########################

buscofile = "3-metrics/busco/{}/{}/run_{}-{}/short_summary_{}-{}.txt".format(tech, asm, asm, tag, asm, tag)
busco_total_buscos = bu_complete = bu_single = bu_dupe = bu_frag = bu_miss = ""
if os.path.isfile(buscofile):
    print ("Reading from BUSCO file...")
    with open(buscofile, "r") as f:
        for line in f:
            if line in ['\n', '\r\n']:
                continue
            rec = line.strip()
            val = rec.split()[0]
            if val == "#":
                continue
            if len(line.split()) < 4:
                continue
            trigger = rec.split()[3]
            if trigger == "(C)":
                bu_complete = int(val)
            elif trigger == "single-copy":
                bu_single = int(val)
            elif trigger == "duplicated":
                bu_dupe = int(val)
            elif trigger == "(F)":
                bu_frag = int(val)
            elif trigger == "(M)":
                bu_miss = int(val)
            elif trigger == "groups":
                bu_total_buscos = int(val)
        busco_vals = [bu_total_buscos, bu_complete, bu_single, bu_dupe, bu_frag, bu_miss]

asm_dict["bu-total"] = bu_total_buscos
asm_dict["bu-comp"] = bu_complete
asm_dict["bu-sing"] = bu_single
asm_dict["bu-dupe"] = bu_dupe
asm_dict["bu-frag"] = bu_frag
asm_dict["bu-miss"] = bu_miss

#############################
## Process BUSCOMP results ##
#############################

if tag == "scaffold":
    if tech == "HYB":
        buscomptechcheck = asm.split('-')[-2]
        if buscomptechcheck in ["nano", "pacbio"]:
            buscompfile = "3-metrics/buscomp/{}/{}/buscomp-ratings.tdt".format(tech, buscomptechcheck + "-hyb-asm-comparison")
        else:
            buscompfile = "3-metrics/buscomp/{}/{}/buscomp-ratings.tdt".format(tech, "hyb-hyb-asm-comparison")
    else:
        buscompfile = "3-metrics/buscomp/{}/{}/buscomp-ratings.tdt".format(tech, tech.lower() + "-asm-comparison")
else:
    buscompfile = "3-metrics/buscomp/{}/{}/{}/buscomp-ratings.tdt".format(tech, asm, asm + "-scaffold-" + group)

bcp_total_bcps = bcp_id = bcp_complete = bcp_single = bcp_dupe = bcp_frag = bcp_partial = bcp_ghost = bcp_miss = ""

if os.path.isfile(buscompfile):
    print ("Reading from BUSCOMP file...")
    with open(buscompfile, "r") as f:
        for line in f:
            if line.startswith("#"):
                continue
            splitline = line.split("\t")
            trigger = splitline[1]
            test = asm + "-" + tag
            if trigger == test:
                bcp_total_bcps = splitline[2].strip()
                bcp_id = splitline[3].strip()
                bcp_complete = splitline[4].strip()
                bcp_single = splitline[5].strip()
                bcp_dupe = splitline[6].strip()
                bcp_frag = splitline[7].strip()
                bcp_partial = splitline[8].strip()
                bcp_ghost = splitline[9].strip()
                bcp_miss = splitline[10].strip()

asm_dict["bcp-total"] = bcp_total_bcps
asm_dict["bcp-id"] = bcp_id
asm_dict["bcp-comp"] = bcp_complete
asm_dict["bcp-sing"] = bcp_single
asm_dict["bcp-dupe"] = bcp_dupe
asm_dict["bcp-frag"] = bcp_frag
asm_dict["bcp-part"] = bcp_partial
asm_dict["bcp-ghost"] = bcp_ghost
asm_dict["bcp-miss"] = bcp_miss

###########################
## Process QUAST results ##
###########################

qpol1 = qpol2 = qr1 = qr2 = ""

if not tag == "scaffold":
    split_tag = tag.split('-')
    split_len = len(split_tag)
    if split_tag[1] == "short":
        qpol1 = split_tag[1] + "-" + split_tag[2]
        qr1 = split_tag[3]
    elif split_tag[1] == "hyb":
        qpol1 = split_tag[1] + "-" + split_tag[2] + "-" + split_tag[3]
        qr1 = split_tag[4]
    elif split_tag[1] == "long":
        qpol1 = split_tag[1] + "-" + split_tag[2] + "-" + split_tag[3]
        qr1 = split_tag[4]
        if split_len > 5:
            qpol2 = split_tag[5] + "-" + split_tag[6]
            qr2 = split_tag[7]

if tag == "scaffold":
    if tech == "HYB":
        quastcheck = asm.split('-')[-2]
        if quastcheck in ["nano", "pacbio"]:
            quastfile = "3-metrics/quast/{}/{}/report.tsv".format(tech, quastcheck + "-hyb-asm-comparison")
        else:
            quastfile = "3-metrics/quast/{}/{}/report.tsv".format(tech, "hyb-hyb-asm-comparison")
    else:
        quastfile = "3-metrics/quast/{}/{}/report.tsv".format(tech, tech.lower() + "-asm-comparison")
    qstring = asm_conv_dict[asm]
else:
    quastfile = "3-metrics/quast/{}/{}/{}/report.tsv".format(tech, asm, asm + "-scaffold-" + group)
    if qpol2 == "":
        qstring = pol_conv_dict[qpol1] + "-" + qr1
    else:
        qstring = pol_conv_dict[qpol1] + "-" + qr1 + "-" + pol_conv_dict[qpol2] + "-" + qr2

quast_frac = quast_mis = quast_local = quast_snp = quast_indel = ""

if os.path.isfile(quastfile):
    print ("Reading from QUAST file...")
    col_no = 0
    with open(quastfile) as f:
        for line in f:
            splitline = line.split("\t")
            trigger = splitline[0].strip()
            if trigger == "Assembly":
                i = 0
                for field in splitline:
                    ftrig = field.strip()
                    if ftrig == qstring:
                        col_no = i
                        break
                    else:
                        i += 1
                if col_no == 0:
                    break
            elif trigger == "# misassemblies":
                quast_mis = splitline[col_no]
            elif trigger == "# local misassemblies":
                quast_local = splitline[col_no]
            elif trigger == "Genome fraction (%)":
                quast_frac = splitline[col_no]
            elif trigger == "# mismatches per 100 kbp":
                quast_snp = splitline[col_no]
            elif trigger == "# indels per 100 kbp":
                quast_indel = splitline[col_no]

asm_dict["qu-genfrac"] = quast_frac
asm_dict["qu-mis"] = quast_mis
asm_dict["qu-local-mis"] = quast_local
asm_dict["qu-snp"] = quast_snp
asm_dict["qu-indel"] = quast_indel

############################
## Process timing results ##
############################

# get assembly timings

asmbenchfile = "benchmarks/{}/{}/{}-benchmark.txt".format(tech, asm, asm)
with open(asmbenchfile, "r") as f:
    print ("Reading from benchmark timings file...")
    line=f.readlines()[1].split("\t")
    asm_bench_sec = line[0]
    asm_bench_wctime = line[1]
    asm_bench_mem = line[2]

asm_dict["asm-time"] = asm_bench_wctime
asm_dict["asm-mem"] = asm_bench_mem

# get polishing timings

pol1_bench_wctime = ""
pol1_bench_mem = ""
pol2_bench_wctime = ""
pol2_bench_mem = ""

if t1 == "ill":
    shortbenchfile = "benchmarks/{}/{}/{}-{}-total-benchmark.txt".format(tech, asm, asm, tag.rstrip('1234567890-')) 
    with open(shortbenchfile, "r") as f:
        for line in f:
            if line in ['\n', '\r\n']:
                continue
            trigger = line.strip()
            if trigger.startswith("Elapsed (wall clock) time"):
                pol1_bench_wctime = trigger.split('):', 1)[1].strip()
            elif trigger.startswith("Maximum resident set"):
                pol1_bench_mem = float(trigger.split('):')[1].strip())/1000.0
elif not t1 == "":
    if not p1 == "medaka":
        longbenchfile = "benchmarks/{}/{}/{}-{}-total-benchmark.txt".format(tech, asm, asm, tag.split('short')[0].rstrip('1234567890-'))
    else:
        longbenchfile = "benchmarks/{}/{}/{}-scaffold-long-medaka-total-benchmark.txt".format(tech, asm, asm)
    with open(longbenchfile, "r") as f:
        line=f.readlines()[1].split("\t")
        pol1_bench_wctime = line[1]
        pol1_bench_mem = line[2]

if t2 == "ill":
    shortbenchfile = "benchmarks/{}/{}/{}-{}-total-benchmark.txt".format(tech, asm, asm, tag.rstrip('1234567890-'))
    with open(shortbenchfile, "r") as f:
        for line in f:
            if line in ['\n', '\r\n']:
                continue
            trigger = line.strip()
            if trigger.startswith("Elapsed (wall clock) time"):
                pol2_bench_wctime = trigger.split('):', 1)[1].strip()
            elif trigger.startswith("Maximum resident set"):
                pol2_bench_mem = float(trigger.split('):')[1].strip())/1000.0

asm_dict["pol-1-time"] = pol1_bench_wctime
asm_dict["pol-1-mem"] = pol1_bench_mem
asm_dict["pol-2-time"] = pol2_bench_wctime
asm_dict["pol-2-mem"] = pol2_bench_mem

# Make CSV

print ("Files read. Printing results...")
asm_df = pd.DataFrame(data=asm_dict, columns=list(asm_dict.keys()), index=[0])

csv_path = os.path.join("4-results", tech, asm, asm + "-" + tag + "-results.csv")
os.makedirs(os.path.dirname(csv_path), exist_ok=True)
asm_df.to_csv(csv_path, index=False)

print ("Done. Results saved to {}".format(csv_path))

