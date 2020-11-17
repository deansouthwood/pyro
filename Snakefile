#######################
# Parameters/settings #
#######################

singularity: "singularity/pyro.simg"

wildcard_constraints:
    shortpol="-(scaffold)",
    longpol="-(scaffold|scaffold-long-arrow-pacbio-4|scaffold-long-medaka-nano-4|scaffold-long-medrac-nano-4|scaffold-long-nextpolish-nano-4|scaffold-long-nextpolish-pacbio-4|scaffold-long-racon-nano-4|scaffold-long-racon-pacbio-4|scaffold-long-racon-comb-4|scaffold-long-nextpolish-comb-4|scaffold-long-medrac-comb-4)",
    reads="(ILL|NANO|PACBIO)",
    longreads="(NANO|PACBIO)",
    readtype="(ill_1|ill_2|nano|pacbio|ill_1-pre|ill_2-pre|nano-pre|pacbio-pre)",
    longreadtype="(nano|pacbio)",
    techs="(ILL|NANO|PACBIO|HYB)",
    nhasm="(haslr-nano-hyb)",
    phasm="(dbg2olc-pacbio-hyb|haslr-pacbio-hyb)",
    hhasm="(masurca-hyb|masurca-flye-hyb|spades-hyb)",
    sround="(scaffold|scaffold-long-arrow-pacbio-4|scaffold-long-medaka-nano-4|scaffold-long-medrac-nano-4|scaffold-long-nextpolish-nano-4|scaffold-long-nextpolish-pacbio-4|scaffold-long-racon-nano-4|scaffold-long-racon-pacbio-4|scaffold-long-racon-comb-4|scaffold-long-nextpolish-comb-4|scaffold-long-medrac-comb-4)-(short-gatk|short-hypo|short-nextpolish|short-ntedit|short-pilon|short-polca|short-racon)",
    lround="(scaffold|scaffold-short-gatk-3|scaffold-short-hypo-3|scaffold-short-nextpolish-3|scaffold-short-ntedit-3|scaffold-short-pilon-3|scaffold-short-polca-3|scaffold-short-racon-3)-(long-arrow-pacbio|long-medaka-nano|long-medrac-nano|long-medrac-comb|long-nextpolish-nano|long-nextpolish-pacbio|long-nextpolish-comb|long-racon-nano|long-racon-pacbio|long-racon-comb|hyb-hypo-nano|hyb-hypo-pacbio|hyb-hypo-hyb)"

READS = [
  "ILL/ill_1",
  "ILL/ill_2",
  "NANO/nano",
  "PACBIO/pacbio",
]

ILL_ASM = [
  "abyss-ill",
  "masurca-ill",
  "meraculous-ill",
  "platanus-ill",
  "ray-ill",
  "soap-ill",
  "spades-ill",
  "sparse-dbg2olc-ill",
  "w2rap-ill",
]

NANO_ASM = [
  "canu-nano",
  "canu-fast-nano",
  "flye-nano",
  "miniasm-nano",
  "necat-nano",
  "raven-nano",
  "shasta-nano",
  "wtdbg2-nano",
]

PACBIO_ASM = [
  "canu-pacbio",
  "falcon-pacbio",
  "flye-pacbio",
  "mecat2-pacbio",
  "miniasm-pacbio",
  "raven-pacbio",
  "wtdbg2-pacbio",
]

QUAST_PACBIO_ASM = [
  "canu-pacbio",
  "falcon-pacbio",
  "flye-pacbio",
  "mecat2-pacbio",
  "wtdbg2-pacbio",
]

NANO_HYB_ASM = [
  "haslr-nano-hyb",
]

PACBIO_HYB_ASM = [
  "dbg2olc-pacbio-hyb",
  "haslr-pacbio-hyb",
]

HYB_ASM = [
  "masurca-hyb",
  "masurca-flye-hyb",
  "spades-hyb",
]

HYB_ASM_ALL = NANO_HYB_ASM + PACBIO_HYB_ASM + HYB_ASM

ILL_POL = [
  "short-gatk",
  "short-hypo",
  "short-nextpolish",
  "short-ntedit",
  "short-pilon",
  "short-polca",
  "short-racon",
]

NANO_POL = [
  "long-medaka-nano",
  "long-medrac-nano",
  "long-nextpolish-nano",
  "long-racon-nano",
]

PACBIO_POL = [
  "long-arrow-pacbio",
  "long-nextpolish-pacbio",
  "long-racon-pacbio",
]

LONG_HYB_POL = [
  "long-arrow-pacbio",
  "long-nextpolish-comb",
  "long-medaka-nano",
  "long-medrac-comb",
  "long-racon-comb",
]

NANO_HYB_POL = [
  "hyb-hypo-nano",
]

PACBIO_HYB_POL = [
  "hyb-hypo-pacbio",
]

HYB_HYB_POL = [
  "hyb-hypo-hyb",
]

ILL_ASM_PROP = [
  "ABySS",
  "MaSuRCA",
  "Meraculous",
  "Platanus",
  "Ray",
  "SOAPdenovo2",
  "SPAdes",
  "SparseAssembler",
  "w2rap",
]

NANO_ASM_PROP = [
  "Canu",
  "Canu-Fast",
  "Flye",
  "miniasm",
  "NECAT",
  "Raven",
  "Shasta",
  "WTDBG2",
]

PACBIO_ASM_PROP = [
  "Canu",
  "FALCON",
  "Flye",
  "MECAT2",
  "miniasm",
  "Raven",
  "WTDBG2",
]

QUAST_PACBIO_ASM_PROP = [
  "Canu",
  "FALCON",
  "Flye",
  "MECAT2",
  "WTDBG2",
]

NANO_HYB_ASM_PROP = [
  "HASLR-Nano",
]

PACBIO_HYB_ASM_PROP = [
  "DBG2OLC-PacBio",
  "HASLR-PacBio",
]

HYB_ASM_PROP = [
  "MaSuRCA-Hybrid",
  "MaSuRCA-Flye-Hybrid",
  "SPAdes-Hybrid",
]

HYB_ASM_ALL_PROP = NANO_HYB_ASM_PROP + PACBIO_HYB_ASM_PROP + HYB_ASM_PROP

ILL_POL_PROP = [
  "GATK",
  "HyPo",
  "NextPolish",
  "ntEdit",
  "Pilon",
  "POLCA",
  "Racon",
]

NANO_POL_PROP = [
  "Medaka",
  "Racon-Medaka",
  "NextPolish",
  "Racon",
]

PACBIO_POL_PROP = [
  "Arrow",
  "NextPolish",
  "Racon",
]

LONG_HYB_POL_PROP = [
  "Arrow",
  "NextPolish-Nano-PacBio",
  "Medaka",
  "Racon-Medaka-Nano-PacBio",
  "Racon-Nano-PacBio",
]

NANO_HYB_POL_PROP = [
  "HyPo-Nano",
]

PACBIO_HYB_POL_PROP = [
  "HyPo-PacBio",
]

HYB_HYB_POL_PROP = [
  "HyPo-Hybrid",
]


configfile: "config/pyro-config.yaml"


####################################
# Additional rule files to include #
####################################

include: "rules/0-data-prep.snk"  # Data preparation rules
include: "rules/1-asm-ill.snk"    # Assembly (illumina) rules
include: "rules/1-asm-nano.snk"   # Assembly (nanopore) rules
include: "rules/1-asm-pacbio.snk" # Assembly (pacbio) rules
include: "rules/1-asm-hyb.snk"    # Assembly (hybrid) rules
include: "rules/2-pol-short.snk"  # Polishing (short reads) rules
include: "rules/2-pol-long.snk"   # Polishing (long reads) rules
include: "rules/3-metrics.snk"    # Metric calculation rules
include: "rules/4-results.snk"    # Results calculation rules

localrules: combine_ill, unzip_ill, dnaqet_model

#########
# Rules #
#########

localrules: all, prep, assemble, polish, metrics

rule all:
    input:
        ".flags/0-data-prep/data-postcheck.success",
        ".flags/0-data-prep/data-process.success",
        ".flags/1-asm/assemble-all.success",
        ".flags/2-pol/polish-all.success",
        ".flags/3-met/dnaqet-all.success",
        ".flags/3-met/quast-all.success",
        ".flags/3-met/repeatmasker-all.success"

rule prep:
    input:
        ".flags/0-data-prep/data-prep.success"

rule assemble:
    input:
        ".flags/1-asm/assemble-all.success"

rule polish:
    input:
        ".flags/2-pol/polish-all.success"

rule metrics:
    input:
        ".flags/3-met/dnaqet-all.success",
        ".flags/3-met/quast-all.success",
        ".flags/3-met/repeatmasker-all.success"

##########################################
# Rules for Checking Directory Structure #
##########################################

localrules: structure_check

rule structure_check:
    input:
    output: 
        flag=".flags/0-data-prep/structure-check.success"
    shell:
        """
        mkdir -p \
          1-assembly/{{ILL,NANO,PACBIO,HYB}} \
          2-polishing/{{ILL,NANO,PACBIO,HYB}} \
          benchmarks \
          3-metrics/{{quast/{{ILL,NANO,PACBIO,HYB}},repeatmasker/{{ILL,NANO,PACBIO,HYB}},dnaqet/{{ILL,NANO,PACBIO,HYB}}}} \
          4-results \
          .flags/{{0-data-prep,1-asm,2-pol,3-met,4-res}} \
          logs/jobs/{{success,fail}} \
          reads/{{ILL,NANO,PACBIO}} \
          reference

        touch {output.flag}
        """
##################################
# Rules for Data Cleaning and QC #
##################################

localrules: data_prep_all, data_trim_all, data_precheck, data_postcheck, data_process

rule data_prep_all:
    input:
        ".flags/0-data-prep/data-postcheck.success",
        ".flags/0-data-prep/data-process.success"
    output: touch(".flags/0-data-prep/data-prep.success")

rule data_precheck:
    input:
        expand("reads/{read}-pre_fastqc.html", read = READS)
    output: touch(".flags/0-data-prep/data-precheck.success")

rule data_trim_all:
    input:
        expand("reads/{read}.fastq.gz", read = READS)
    output: touch(".flags/0-data-prep/data_trim.success")

rule data_postcheck:
    input:
        expand("reads/{read}_fastqc.html", read = READS)
    output: touch(".flags/0-data-prep/data-postcheck.success")

rule data_process:
    input:
        "reads/ILL/ill_combined.fastq.gz"
#        ".flags/0-data-prep/pacbio-bam-process.success"
    output: touch(".flags/0-data-prep/data-process.success")

######################
# Rules for Assembly #
######################

localrules: assemble_all, assemble_ill, assemble_nano, assemble_pacbio, assemble_hyb

rule assemble_all:
    input: 
        ".flags/0-data-prep/data-prep.success",
        expand("1-assembly/ILL/{ill}/{ill}-scaffold.fa", ill = ILL_ASM),
        expand("1-assembly/NANO/{nano}/{nano}-scaffold.fa", nano = NANO_ASM),
        expand("1-assembly/PACBIO/{pacbio}/{pacbio}-scaffold.fa", pacbio = PACBIO_ASM),
        expand("1-assembly/HYB/{nhyb}/{nhyb}-scaffold.fa", nhyb = NANO_HYB_ASM),
        expand("1-assembly/HYB/{phyb}/{phyb}-scaffold.fa", phyb = PACBIO_HYB_ASM),
        expand("1-assembly/HYB/{hyb}/{hyb}-scaffold.fa", hyb = HYB_ASM)
    output:
        touch(".flags/1-asm/assemble-all.success")

rule assemble_ill:
    input:
        expand("reads/ILL/ill_{i}_fastqc.html", i = ["1","2"]),
        "reads/ILL/ill_combined.fastq.gz",
        expand("1-assembly/ILL/{ill}/{ill}-scaffold.fa", ill = ILL_ASM)
    output: touch(".flags/1-asm/assemble-ill.success")

rule assemble_nano:
    input:
        "reads/NANO/nano_fastqc.html",
        expand("1-assembly/NANO/{nano}/{nano}-scaffold.fa", nano = NANO_ASM)
    output: touch(".flags/1-asm/assemble-nano.success")

rule assemble_pacbio:
    input:
        "reads/PACBIO/pacbio_fastqc.html",
        expand("1-assembly/PACBIO/{pacbio}/{pacbio}-scaffold.fa", pacbio = PACBIO_ASM)
    output: touch(".flags/1-asm/assemble-pacbio.success")

rule assemble_hyb:
    input:
        expand("reads/{read}_fastqc.html", read = READS),
        expand("1-assembly/HYB/{nhyb}/{nhyb}-scaffold.fa", nhyb = NANO_HYB_ASM),
        expand("1-assembly/HYB/{phyb}/{phyb}-scaffold.fa", phyb = PACBIO_HYB_ASM),
        expand("1-assembly/HYB/{hyb}/{hyb}-scaffold.fa", hyb = HYB_ASM)
    output: touch(".flags/1-asm/assemble-hyb.success")

#########################
# Rules for Moving Data #
#########################

localrules: migrate_scaffold

rule migrate_scaffold:
    input:
        "1-assembly/{techs}/{asm}/{asm}-scaffold.fa"
    output:
        "2-polishing/{techs}/{asm}/{asm}-scaffold.fa"
    shell:
        "cp {input} {output}"

#######################
# Rules for Polishing #
#######################

localrules: polish_all, polish_ill, polish_nano, polish_pacbio, polish_hyb

rule polish_all:
    input:
        ".flags/2-pol/polish-ill.success",
        ".flags/2-pol/polish-nano.success",
        ".flags/2-pol/polish-pacbio.success",
        ".flags/2-pol/polish-hyb.success"
    output: touch(".flags/2-pol/polish-all.success")

# Illumina

rule polish_ill:
    input:
        expand(".flags/2-pol/ILL/{ill}/{ill}-scaffold-short.success", ill = ILL_ASM)
    output: touch(".flags/2-pol/polish-ill.success")

# Nanopore

rule polish_nano:
    input:
        expand(".flags/2-pol/NANO/{nano}/{nano}-scaffold-short.success", nano = NANO_ASM),
        expand(".flags/2-pol/NANO/{nano}/{nano}-scaffold-{long}-4-short.success", nano = NANO_ASM, long = NANO_POL),
        expand("2-polishing/NANO/{nano}/{nano}-scaffold-{hpoln}-4.fa", nano = NANO_ASM, hpoln = NANO_HYB_POL)
    output: touch(".flags/2-pol/polish-nano.success")

rule polish_nano_short:
    input:
        expand(".flags/2-pol/NANO/{nano}/{nano}-scaffold-short.success", nano = NANO_ASM)

rule polish_nano_long:
    input:
        expand("2-polishing/NANO/{nano}/{nano}-scaffold-{long}-4.fa", nano = NANO_ASM, long = NANO_POL)

rule polish_nano_long_short:
    input:
        expand(".flags/2-pol/NANO/{nano}/{nano}-scaffold-{long}-4-short.success", nano = NANO_ASM, long = NANO_POL)

rule polish_nano_hyb:
    input:
        expand("2-polishing/NANO/{nano}/{nano}-scaffold-{hpoln}-4.fa", nano = NANO_ASM, hpoln = NANO_HYB_POL)

# PacBio

rule polish_pacbio:
    input:
        expand(".flags/2-pol/PACBIO/{pacbio}/{pacbio}-scaffold-short.success", pacbio = PACBIO_ASM),
        expand(".flags/2-pol/PACBIO/{pacbio}/{pacbio}-scaffold-{long}-4-short.success", pacbio = PACBIO_ASM, long = PACBIO_POL),
        expand("2-polishing/PACBIO/{pacbio}/{pacbio}-scaffold-{hpolp}-4.fa", pacbio = PACBIO_ASM, hpolp = PACBIO_HYB_POL)
    output: touch(".flags/2-pol/polish-pacbio.success")

rule polish_pacbio_short:
    input:
        expand(".flags/2-pol/PACBIO/{pacbio}/{pacbio}-scaffold-short.success", pacbio = PACBIO_ASM)

rule polish_pacbio_long:
    input:
        expand("2-polishing/PACBIO/{pacbio}/{pacbio}-scaffold-{long}-4.fa", pacbio = PACBIO_ASM, long = PACBIO_POL)

rule polish_pacbio_long_short:
    input:
        expand(".flags/2-pol/PACBIO/{pacbio}/{pacbio}-scaffold-{long}-4-short.success", pacbio = PACBIO_ASM, long = PACBIO_POL)

rule polish_pacbio_hyb:
    input:
        expand("2-polishing/PACBIO/{pacbio}/{pacbio}-scaffold-{hpolp}-4.fa", pacbio = PACBIO_ASM, hpolp = PACBIO_HYB_POL)

# Hybrid

rule polish_hyb:
    input:
        expand(".flags/2-pol/HYB/{nhyb}/{nhyb}-scaffold-short.success", nhyb = NANO_HYB_ASM),
        expand(".flags/2-pol/HYB/{nhyb}/{nhyb}-scaffold-{npol}-4-short.success", nhyb = NANO_HYB_ASM, npol = NANO_POL),
        expand("2-polishing/HYB/{nhyb}/{nhyb}-scaffold-{hpoln}-4.fa", nhyb = NANO_HYB_ASM, hpoln = NANO_HYB_POL),
        expand(".flags/2-pol/HYB/{phyb}/{phyb}-scaffold-short.success", phyb = PACBIO_HYB_ASM),
        expand(".flags/2-pol/HYB/{phyb}/{phyb}-scaffold-{ppol}-4-short.success", phyb = PACBIO_HYB_ASM, ppol = PACBIO_POL),
        expand("2-polishing/HYB/{phyb}/{phyb}-scaffold-{hpolp}-4.fa", phyb = PACBIO_HYB_ASM, hpolp = PACBIO_HYB_POL),
        expand(".flags/2-pol/HYB/{hhyb}/{hhyb}-scaffold-short.success", hhyb = HYB_ASM),
        expand(".flags/2-pol/HYB/{hhyb}/{hhyb}-scaffold-{lpol}-4-short.success", hhyb  = HYB_ASM, lpol = LONG_HYB_POL),
        expand("2-polishing/HYB/{hhyb}/{hhyb}-scaffold-{hpolh}-4.fa", hhyb = HYB_ASM, hpolh = HYB_HYB_POL)
    output: touch(".flags/2-pol/polish-hyb.success")

rule polish_hyb_short:
    input:
        expand(".flags/2-pol/HYB/{nhyb}/{nhyb}-scaffold-short.success", nhyb = NANO_HYB_ASM),
        expand(".flags/2-pol/HYB/{phyb}/{phyb}-scaffold-short.success", phyb = PACBIO_HYB_ASM),
        expand(".flags/2-pol/HYB/{hhyb}/{hhyb}-scaffold-short.success", hhyb = HYB_ASM)

rule polish_hyb_long:
    input:
        expand("2-polishing/HYB/{nhyb}/{nhyb}-scaffold-{npol}-4.fa", nhyb = NANO_HYB_ASM, npol = NANO_POL),
        expand("2-polishing/HYB/{phyb}/{phyb}-scaffold-{ppol}-4.fa", phyb = PACBIO_HYB_ASM, ppol = PACBIO_POL),
        expand("2-polishing/HYB/{hhyb}/{hhyb}-scaffold-{lpol}-4.fa", hhyb = HYB_ASM, lpol = LONG_HYB_POL)

rule polish_hyb_long_short:
    input:
        expand(".flags/2-pol/HYB/{nhyb}/{nhyb}-scaffold-{npol}-4-short.success", nhyb = NANO_HYB_ASM, npol = NANO_POL),
        expand(".flags/2-pol/HYB/{phyb}/{phyb}-scaffold-{ppol}-4-short.success", phyb = PACBIO_HYB_ASM, ppol = PACBIO_POL),
        expand(".flags/2-pol/HYB/{hhyb}/{hhyb}-scaffold-{lpol}-4-short.success", hhyb = HYB_ASM, lpol = LONG_HYB_POL)

rule polish_hyb_hyb:
    input:
        expand("2-polishing/HYB/{nhyb}/{nhyb}-scaffold-{hpoln}-4.fa", nhyb = NANO_HYB_ASM, hpoln = NANO_HYB_POL),
        expand("2-polishing/HYB/{phyb}/{phyb}-scaffold-{hpolp}-4.fa", phyb = PACBIO_HYB_ASM, hpolp = PACBIO_HYB_POL),
        expand("2-polishing/HYB/{hhyb}/{hhyb}-scaffold-{hpolh}-4.fa", hhyb = HYB_ASM, hpolh = HYB_HYB_POL)



#####################
# Rules for Metrics #
#####################

### DNAQET ###

localrules: 
    dnaqet_check_all, dnaqet_ill_check_all, dnaqet_ill_check_asm, dnaqet_ill_check_pol,
    dnaqet_nano_check_all, dnaqet_nano_check_asm, dnaqet_nano_check_pol,
    dnaqet_pacbio_check_all, dnaqet_pacbio_check_asm, dnaqet_pacbio_check_pol,
    dnaqet_hyb_check_all, dnaqet_hyb_check_asm, dnaqet_nano_hyb_check_pol, dnaqet_pacbio_hyb_check_pol, dnaqet_hyb_hyb_check_pol

rule dnaqet_check_all:
    input:
        ".flags/3-met/dnaqet-ill-all.success",
        ".flags/3-met/dnaqet-nano-all.success",
        ".flags/3-met/dnaqet-pacbio-all.success",
        ".flags/3-met/dnaqet-hyb-all.success"
    output: touch(".flags/3-met/dnaqet-all.success")

## Illumina Assemblies

rule dnaqet_ill_check_all:
    input:
        ".flags/3-met/dnaqet-ill-asm.success",
        ".flags/3-met/dnaqet-ill-pol.success"
    output: touch(".flags/3-met/dnaqet-ill-all.success")

rule dnaqet_ill_check_asm:
    input:
        expand("3-metrics/dnaqet/ILL/{ill}/{ill}-scaffold/reports/assembly.stat", ill = ILL_ASM)
    output: touch(".flags/3-met/dnaqet-ill-asm.success")

rule dnaqet_ill_check_pol:
    input:
        expand("3-metrics/dnaqet/ILL/{ill}/{ill}-scaffold-{pol}-3/reports/assembly.stat", ill = ILL_ASM, pol = ILL_POL)
    output: touch(".flags/3-met/dnaqet-ill-pol.success")

## Nanopore Assemblies

rule dnaqet_nano_check_all:
    input:
        ".flags/3-met/dnaqet-nano-asm.success",
        ".flags/3-met/dnaqet-nano-pol.success"
    output: touch(".flags/3-met/dnaqet-nano-all.success")

rule dnaqet_nano_check_asm:
    input:
        expand("3-metrics/dnaqet/NANO/{nano}/{nano}-scaffold/reports/assembly.stat", nano = NANO_ASM)
    output: touch(".flags/3-met/dnaqet-nano-asm.success")

rule dnaqet_nano_check_pol:
    input:
        expand("3-metrics/dnaqet/NANO/{nano}/{nano}-scaffold-{spol}-3/reports/assembly.stat", nano = NANO_ASM, spol = ILL_POL),
        expand("3-metrics/dnaqet/NANO/{nano}/{nano}-scaffold-{lpol}-4/reports/assembly.stat", nano = NANO_ASM, lpol = NANO_POL),
#        expand("3-metrics/dnaqet/NANO/{nano}/{nano}-scaffold-{spol}-3-{lpol}-4/reports/assembly.stat", nano = NANO_ASM, spol = ILL_POL, lpol = NANO_POL),
        expand("3-metrics/dnaqet/NANO/{nano}/{nano}-scaffold-{lpol}-4-{spol}-3/reports/assembly.stat", nano = NANO_ASM, lpol = NANO_POL, spol = ILL_POL),
        expand("3-metrics/dnaqet/NANO/{nano}/{nano}-scaffold-{hpol}-4/reports/assembly.stat", nano = NANO_ASM, hpol = NANO_HYB_POL)
    output: touch(".flags/3-met/dnaqet-nano-pol.success")

## PacBio Assemblies

rule dnaqet_pacbio_check_all:
    input:
        ".flags/3-met/dnaqet-pacbio-asm.success",
        ".flags/3-met/dnaqet-pacbio-pol.success"
    output: touch(".flags/3-met/dnaqet-pacbio-all.success")

rule dnaqet_pacbio_check_asm:
    input:
        expand("3-metrics/dnaqet/PACBIO/{pacbio}/{pacbio}-scaffold/reports/assembly.stat", pacbio = PACBIO_ASM)
    output: touch(".flags/3-met/dnaqet-pacbio-asm.success")

rule dnaqet_pacbio_check_pol:
    input:
        expand("3-metrics/dnaqet/PACBIO/{pacbio}/{pacbio}-scaffold-{spol}-3/reports/assembly.stat", pacbio = PACBIO_ASM, spol = ILL_POL),
        expand("3-metrics/dnaqet/PACBIO/{pacbio}/{pacbio}-scaffold-{lpol}-4/reports/assembly.stat", pacbio = PACBIO_ASM, lpol = PACBIO_POL),
#        expand("3-metrics/dnaqet/PACBIO/{pacbio}/{pacbio}-scaffold-{spol}-3-{lpol}-4/reports/assembly.stat", pacbio = PACBIO_ASM, spol = ILL_POL, lpol = PACBIO_POL),
        expand("3-metrics/dnaqet/PACBIO/{pacbio}/{pacbio}-scaffold-{lpol}-4-{spol}-3/reports/assembly.stat", pacbio = PACBIO_ASM, lpol = PACBIO_POL, spol = ILL_POL),
        expand("3-metrics/dnaqet/PACBIO/{pacbio}/{pacbio}-scaffold-{hpol}-4/reports/assembly.stat", pacbio = PACBIO_ASM, hpol = PACBIO_HYB_POL)
    output: touch(".flags/3-met/dnaqet-pacbio-pol.success")

## Hybrid Assemblies

rule dnaqet_hyb_check_all:
    input:
        ".flags/3-met/dnaqet-hyb-asm.success",
        ".flags/3-met/dnaqet-nano-hyb-pol.success",
        ".flags/3-met/dnaqet-pacbio-hyb-pol.success",
        ".flags/3-met/dnaqet-hyb-hyb-pol.success"
    output: touch(".flags/3-met/dnaqet-hyb-all.success")

rule dnaqet_hyb_check_asm:
    input:
        expand("3-metrics/dnaqet/HYB/{nhyb}/{nhyb}-scaffold/reports/assembly.stat", nhyb = NANO_HYB_ASM),
        expand("3-metrics/dnaqet/HYB/{phyb}/{phyb}-scaffold/reports/assembly.stat", phyb = PACBIO_HYB_ASM),
        expand("3-metrics/dnaqet/HYB/{hhyb}/{hhyb}-scaffold/reports/assembly.stat", hhyb = HYB_ASM)
    output: touch(".flags/3-met/dnaqet-hyb-asm.success")

rule dnaqet_nano_hyb_check_pol:
    input:
        expand("3-metrics/dnaqet/HYB/{nano}/{nano}-scaffold-{spol}-3/reports/assembly.stat", nano = NANO_HYB_ASM, spol = ILL_POL),
        expand("3-metrics/dnaqet/HYB/{nano}/{nano}-scaffold-{lpol}-4/reports/assembly.stat", nano = NANO_HYB_ASM, lpol = NANO_POL),
#        expand("3-metrics/dnaqet/HYB/{nano}/{nano}-scaffold-{spol}-3-{lpol}-4/reports/assembly.stat", nano = NANO_HYB_ASM, spol = ILL_POL, lpol = NANO_POL),
        expand("3-metrics/dnaqet/HYB/{nano}/{nano}-scaffold-{lpol}-4-{spol}-3/reports/assembly.stat", nano = NANO_HYB_ASM, lpol = NANO_POL, spol = ILL_POL),
        expand("3-metrics/dnaqet/HYB/{nano}/{nano}-scaffold-{hpol}-4/reports/assembly.stat", nano = NANO_HYB_ASM, hpol = NANO_HYB_POL)
    output: touch(".flags/3-met/dnaqet-nano-hyb-pol.success")

rule dnaqet_pacbio_hyb_check_pol:
    input:
        expand("3-metrics/dnaqet/HYB/{pacbio}/{pacbio}-scaffold-{spol}-3/reports/assembly.stat", pacbio = PACBIO_HYB_ASM, spol = ILL_POL),
        expand("3-metrics/dnaqet/HYB/{pacbio}/{pacbio}-scaffold-{lpol}-4/reports/assembly.stat", pacbio = PACBIO_HYB_ASM, lpol = PACBIO_POL),
#        expand("3-metrics/dnaqet/HYB/{pacbio}/{pacbio}-scaffold-{spol}-3-{lpol}-4/reports/assembly.stat", pacbio = PACBIO_HYB_ASM, spol = ILL_POL, lpol = PACBIO_POL),
        expand("3-metrics/dnaqet/HYB/{pacbio}/{pacbio}-scaffold-{lpol}-4-{spol}-3/reports/assembly.stat", pacbio = PACBIO_HYB_ASM, lpol = PACBIO_POL, spol = ILL_POL),
        expand("3-metrics/dnaqet/HYB/{pacbio}/{pacbio}-scaffold-{hpol}-4/reports/assembly.stat", pacbio = PACBIO_HYB_ASM, hpol = PACBIO_HYB_POL)
    output: touch(".flags/3-met/dnaqet-pacbio-hyb-pol.success")

rule dnaqet_hyb_hyb_check_pol:
    input:
        expand("3-metrics/dnaqet/HYB/{hyb}/{hyb}-scaffold-{spol}-3/reports/assembly.stat", hyb = HYB_ASM, spol = ILL_POL),
        expand("3-metrics/dnaqet/HYB/{hyb}/{hyb}-scaffold-{lpol}-4/reports/assembly.stat", hyb = HYB_ASM, lpol = LONG_HYB_POL),
#        expand("3-metrics/dnaqet/HYB/{hyb}/{hyb}-scaffold-{spol}-3-{lpol}-4/reports/assembly.stat", hyb = HYB_ASM, spol = ILL_POL, lpol = LONG_HYB_POL),
        expand("3-metrics/dnaqet/HYB/{hyb}/{hyb}-scaffold-{lpol}-4-{spol}-3/reports/assembly.stat", hyb = HYB_ASM, lpol = LONG_HYB_POL, spol = ILL_POL),
        expand("3-metrics/dnaqet/HYB/{hyb}/{hyb}-scaffold-{hpol}-4/reports/assembly.stat", hyb = HYB_ASM, hpol = HYB_HYB_POL)
    output: touch(".flags/3-met/dnaqet-hyb-hyb-pol.success")

### QUAST ###

localrules:
    quast_check_all, quast_ill_check_all, quast_ill_check_asm, quast_ill_check_pol,
    quast_nano_check_all, quast_nano_check_asm, quast_nano_check_pol,
    quast_pacbio_check_all, quast_pacbio_check_asm, quast_pacbio_check_pol,
    quast_hyb_check_all, quast_hyb_check_asm, quast_nano_hyb_check_pol, quast_pacbio_hyb_check_pol, quast_hyb_hyb_check_pol

rule quast_check_all:
    input:
        ".flags/3-met/quast-ill-all.success",
        ".flags/3-met/quast-nano-all.success",
        ".flags/3-met/quast-pacbio-all.success",
        ".flags/3-met/quast-hyb-all.success"
    output: touch(".flags/3-met/quast-all.success")

## Illumina Assemblies ##

rule quast_ill_check_all:
    input:
        ".flags/3-met/quast-ill-asm.success",
        ".flags/3-met/quast-ill-pol.success"
    output: touch(".flags/3-met/quast-ill-all.success")

rule quast_ill_check_asm:
    input:
        "3-metrics/quast/ILL/ill-asm-comparison/report.tsv"
    output: touch(".flags/3-met/quast-ill-asm.success")

rule quast_ill_check_pol:
    input:
        expand("3-metrics/quast/ILL/{ill}/{ill}-scaffold-short/report.tsv", ill = ILL_ASM)
    output: touch(".flags/3-met/quast-ill-pol.success")

## Nanopore Assemblies ##

rule quast_nano_check_all:
    input:
        ".flags/3-met/quast-nano-asm.success",
        ".flags/3-met/quast-nano-pol.success"
    output: touch(".flags/3-met/quast-nano-all.success")

rule quast_nano_check_asm:
    input:
        "3-metrics/quast/NANO/nano-asm-comparison/report.tsv"
    output: touch(".flags/3-met/quast-nano-asm.success")

rule quast_nano_check_pol:
    input:
        expand("3-metrics/quast/NANO/{nano}/{nano}-scaffold-{size}/report.tsv", nano = NANO_ASM, size = ["short", "long", "long-short", "hyb"])
    output: touch(".flags/3-met/quast-nano-pol.success")

## PacBio Assemblies ##

rule quast_pacbio_check_all:
    input:
        ".flags/3-met/quast-pacbio-asm.success",
        ".flags/3-met/quast-pacbio-pol.success"
    output: touch(".flags/3-met/quast-pacbio-all.success")

rule quast_pacbio_check_asm:
    input:
        "3-metrics/quast/PACBIO/pacbio-asm-comparison/report.tsv"
    output: touch(".flags/3-met/quast-pacbio-asm.success")

rule quast_pacbio_check_pol:
    input:
        expand("3-metrics/quast/PACBIO/{pacbio}/{pacbio}-scaffold-{size}/report.tsv", pacbio = PACBIO_ASM, size = ["short", "long", "long-short", "hyb"])
    output: touch(".flags/3-met/quast-pacbio-pol.success")

## Hybrid Assemblies ##

rule quast_hyb_check_all:
    input:
        ".flags/3-met/quast-hyb-asm.success",
        ".flags/3-met/quast-nano-hyb-pol.success",
        ".flags/3-met/quast-pacbio-hyb-pol.success",
        ".flags/3-met/quast-hyb-hyb-pol.success"
    output: touch(".flags/3-met/quast-hyb-all.success")

rule quast_hyb_check_asm:
    input:
        "3-metrics/quast/HYB/nano-hyb-asm-comparison/report.tsv",
        "3-metrics/quast/HYB/pacbio-hyb-asm-comparison/report.tsv",
        "3-metrics/quast/HYB/hyb-hyb-asm-comparison/report.tsv"
    output: touch(".flags/3-met/quast-hyb-asm.success")

rule quast_nano_hyb_check_pol:
    input:
        expand("3-metrics/quast/HYB/{nhyb}/{nhyb}-scaffold-{size}/report.tsv", nhyb = NANO_HYB_ASM, size = ["short", "long", "long-short", "hyb"])
    output: touch(".flags/3-met/quast-nano-hyb-pol.success")

rule quast_pacbio_hyb_check_pol:
    input:
        expand("3-metrics/quast/HYB/{phyb}/{phyb}-scaffold-{size}/report.tsv", phyb = PACBIO_HYB_ASM, size = ["short", "long", "long-short", "hyb"])
    output: touch(".flags/3-met/quast-pacbio-hyb-pol.success")

rule quast_hyb_hyb_check_pol:
    input:
        expand("3-metrics/quast/HYB/{hhyb}/{hhyb}-scaffold-{size}/report.tsv", hhyb = HYB_ASM, size = ["short", "long", "long-short", "hyb"])
    output: touch(".flags/3-met/quast-hyb-hyb-pol.success")

### REPEATMASKER ###

localrules:
    repeatmasker_check_all, repeatmasker_ill_check_all, repeatmasker_ill_check_asm, repeatmasker_ill_check_pol,
    repeatmasker_nano_check_all, repeatmasker_nano_check_asm, repeatmasker_nano_check_pol,
    repeatmasker_pacbio_check_all, repeatmasker_pacbio_check_asm, repeatmasker_pacbio_check_pol,
    repeatmasker_hyb_check_all, repeatmasker_hyb_check_asm, repeatmasker_nano_hyb_check_pol, repeatmasker_pacbio_hyb_check_pol, repeatmasker_hyb_hyb_check_pol

rule repeatmasker_check_all:
    input:
        ".flags/3-met/repeatmasker-ill-all.success",
        ".flags/3-met/repeatmasker-nano-all.success",
        ".flags/3-met/repeatmasker-pacbio-all.success",
        ".flags/3-met/repeatmasker-hyb-all.success"
    output: touch(".flags/3-met/repeatmasker-all.success")

## Illumina assemblies ##

rule repeatmasker_ill_check_all:
    input:
        ".flags/3-met/repeatmasker-ill-asm.success",
        ".flags/3-met/repeatmasker-ill-pol.success"
    output: touch(".flags/3-met/repeatmasker-ill-all.success")

rule repeatmasker_ill_check_asm:
    input:
        expand("3-metrics/repeatmasker/ILL/{ill}/{ill}-scaffold.tbl", ill = ILL_ASM)
    output: touch(".flags/3-met/repeatmasker-ill-asm.success")

rule repeatmasker_ill_check_pol:
    input:
        expand("3-metrics/repeatmasker/ILL/{ill}/{ill}-scaffold-{pol}-3.tbl", ill = ILL_ASM, pol = ILL_POL)
    output: touch(".flags/3-met/repeatmasker-ill-pol.success")

## Nanopore Assemblies ##

rule repeatmasker_nano_check_all:
    input:
        ".flags/3-met/repeatmasker-nano-asm.success",
        ".flags/3-met/repeatmasker-nano-pol.success"
    output: touch(".flags/3-met/repeatmasker-nano-all.success")

rule repeatmasker_nano_check_asm:
    input:
        expand("3-metrics/repeatmasker/NANO/{nano}/{nano}-scaffold.tbl", nano = NANO_ASM)
    output: touch(".flags/3-met/repeatmasker-nano-asm.success")

rule repeatmasker_nano_check_pol:
    input:
        expand("3-metrics/repeatmasker/NANO/{nano}/{nano}-scaffold-{spol}-3.tbl", nano = NANO_ASM, spol = ILL_POL),
        expand("3-metrics/repeatmasker/NANO/{nano}/{nano}-scaffold-{lpol}-4.tbl", nano = NANO_ASM, lpol = NANO_POL),
#        expand("3-metrics/repeatmasker/NANO/{nano}/{nano}-scaffold-{spol}-3-{lpol}-4.tbl", nano = NANO_ASM, spol = ILL_POL, lpol = NANO_POL),
        expand("3-metrics/repeatmasker/NANO/{nano}/{nano}-scaffold-{lpol}-4-{spol}-3.tbl", nano = NANO_ASM, lpol = NANO_POL, spol = ILL_POL),
        expand("3-metrics/repeatmasker/NANO/{nano}/{nano}-scaffold-{hpol}-4.tbl", nano = NANO_ASM, hpol = NANO_HYB_POL)
    output: touch(".flags/3-met/repeatmasker-nano-pol.success")

## PacBio Assemblies ##

rule repeatmasker_pacbio_check_all:
    input:
        ".flags/3-met/repeatmasker-pacbio-asm.success",
        ".flags/3-met/repeatmasker-pacbio-pol.success"
    output: touch(".flags/3-met/repeatmasker-pacbio-all.success")

rule repeatmasker_pacbio_check_asm:
    input:
        expand("3-metrics/repeatmasker/PACBIO/{pacbio}/{pacbio}-scaffold.tbl", pacbio = PACBIO_ASM)
    output: touch(".flags/3-met/repeatmasker-pacbio-asm.success")

rule repeatmasker_pacbio_check_pol:
    input:
        expand("3-metrics/repeatmasker/PACBIO/{pacbio}/{pacbio}-scaffold-{spol}-3.tbl", pacbio = PACBIO_ASM, spol = ILL_POL),
        expand("3-metrics/repeatmasker/PACBIO/{pacbio}/{pacbio}-scaffold-{lpol}-4.tbl", pacbio = PACBIO_ASM, lpol = PACBIO_POL),
#        expand("3-metrics/repeatmasker/PACBIO/{pacbio}/{pacbio}-scaffold-{spol}-3-{lpol}-4.tbl", pacbio = PACBIO_ASM, spol = ILL_POL, lpol = PACBIO_POL),
        expand("3-metrics/repeatmasker/PACBIO/{pacbio}/{pacbio}-scaffold-{lpol}-4-{spol}-3.tbl", pacbio = PACBIO_ASM, lpol = PACBIO_POL, spol = ILL_POL),
        expand("3-metrics/repeatmasker/PACBIO/{pacbio}/{pacbio}-scaffold-{hpol}-4.tbl", pacbio = PACBIO_ASM, hpol = PACBIO_HYB_POL)
    output: touch(".flags/3-met/repeatmasker-pacbio-pol.success")

## Hybrid Assemblies

rule repeatmasker_hyb_check_all:
    input:
        ".flags/3-met/repeatmasker-hyb-asm.success",
        ".flags/3-met/repeatmasker-nano-hyb-pol.success",
        ".flags/3-met/repeatmasker-pacbio-hyb-pol.success",
        ".flags/3-met/repeatmasker-hyb-hyb-pol.success"
    output: touch(".flags/3-met/repeatmasker-hyb-all.success")

rule repeatmasker_hyb_check_asm:
    input:
        expand("3-metrics/repeatmasker/HYB/{nhyb}/{nhyb}-scaffold.tbl", nhyb = NANO_HYB_ASM),
        expand("3-metrics/repeatmasker/HYB/{phyb}/{phyb}-scaffold.tbl", phyb = PACBIO_HYB_ASM),
        expand("3-metrics/repeatmasker/HYB/{hhyb}/{hhyb}-scaffold.tbl", hhyb = HYB_ASM)
    output: touch(".flags/3-met/repeatmasker-hyb-asm.success")

rule repeatmasker_nano_hyb_check_pol:
    input:
        expand("3-metrics/repeatmasker/HYB/{hyb}/{hyb}-scaffold-{spol}-3.tbl", hyb = NANO_HYB_ASM, spol = ILL_POL),
        expand("3-metrics/repeatmasker/HYB/{hyb}/{hyb}-scaffold-{lpol}-4.tbl", hyb = NANO_HYB_ASM, lpol = NANO_POL),
#        expand("3-metrics/repeatmasker/HYB/{hyb}/{hyb}-scaffold-{spol}-3-{lpol}-4.tbl", hyb = NANO_HYB_ASM, spol = ILL_POL, lpol = NANO_POL),
        expand("3-metrics/repeatmasker/HYB/{hyb}/{hyb}-scaffold-{lpol}-4-{spol}-3.tbl", hyb = NANO_HYB_ASM, lpol = NANO_POL, spol = ILL_POL),
        expand("3-metrics/repeatmasker/HYB/{hyb}/{hyb}-scaffold-{hpol}-4.tbl", hyb = NANO_HYB_ASM, hpol = NANO_HYB_POL)
    output: touch(".flags/3-met/repeatmasker-nano-hyb-pol.success")

rule repeatmasker_pacbio_hyb_check_pol:
    input:
        expand("3-metrics/repeatmasker/HYB/{hyb}/{hyb}-scaffold-{spol}-3.tbl", hyb = PACBIO_HYB_ASM, spol = ILL_POL),
        expand("3-metrics/repeatmasker/HYB/{hyb}/{hyb}-scaffold-{lpol}-4.tbl", hyb = PACBIO_HYB_ASM, lpol = PACBIO_POL),
#        expand("3-metrics/repeatmasker/HYB/{hyb}/{hyb}-scaffold-{spol}-3-{lpol}-4.tbl", hyb = PACBIO_HYB_ASM, spol = ILL_POL, lpol = PACBIO_POL),
        expand("3-metrics/repeatmasker/HYB/{hyb}/{hyb}-scaffold-{lpol}-4-{spol}-3.tbl", hyb = PACBIO_HYB_ASM, lpol = PACBIO_POL, spol = ILL_POL),
        expand("3-metrics/repeatmasker/HYB/{hyb}/{hyb}-scaffold-{hpol}-4.tbl", hyb = PACBIO_HYB_ASM, hpol = PACBIO_HYB_POL)
    output: touch(".flags/3-met/repeatmasker-pacbio-hyb-pol.success")

rule repeatmasker_hyb_hyb_check_pol:
    input:
        expand("3-metrics/repeatmasker/HYB/{hyb}/{hyb}-scaffold-{spol}-3.tbl", hyb = HYB_ASM, spol = ILL_POL),
        expand("3-metrics/repeatmasker/HYB/{hyb}/{hyb}-scaffold-{lpol}-4.tbl", hyb = HYB_ASM, lpol = LONG_HYB_POL),
#        expand("3-metrics/repeatmasker/HYB/{hyb}/{hyb}-scaffold-{spol}-3-{lpol}-4.tbl", hyb = HYB_ASM, spol = ILL_POL, lpol = LONG_HYB_POL),
        expand("3-metrics/repeatmasker/HYB/{hyb}/{hyb}-scaffold-{lpol}-4-{spol}-3.tbl", hyb = HYB_ASM, lpol = LONG_HYB_POL, spol = ILL_POL),
        expand("3-metrics/repeatmasker/HYB/{hyb}/{hyb}-scaffold-{hpol}-4.tbl", hyb = HYB_ASM, hpol = HYB_HYB_POL)
    output: touch(".flags/3-met/repeatmasker-hyb-hyb-pol.success")

### BUSCO ###

localrules: busco_check_all, busco_check_all_asm

rule busco_check_all:
    input:
        ".flags/3-met/busco-ill-all.success",
        ".flags/3-met/busco-nano-all.success",
        ".flags/3-met/busco-pacbio-all.success",
        ".flags/3-met/busco-hyb-all.success"
    output: touch(".flags/3-met/busco-all.success")

rule busco_check_all_asm:
    input:
        ".flags/3-met/busco-ill-asm.success",
        ".flags/3-met/busco-nano-asm.success",
        ".flags/3-met/busco-pacbio-asm.success",
        ".flags/3-met/busco-hyb-asm.success"

# Illumina

localrules: busco_ill_check_all, busco_ill_check_asm, busco_ill_check_pol

rule busco_ill_check_all:
    input:
        ".flags/3-met/busco-ill-asm.success",
        ".flags/3-met/busco-ill-pol.success"
    output: touch(".flags/3-met/busco-ill-all.success")

rule busco_ill_check_asm:
    input:
        expand("3-metrics/busco/ILL/{ill}/run_{ill}-scaffold/short_summary_{ill}-scaffold.txt", ill = ILL_ASM)
    output: touch(".flags/3-met/busco-ill-asm.success")

rule busco_ill_check_pol:
    input:
        expand("3-metrics/busco/ILL/{ill}/run_{ill}-scaffold-{spol}-{i}/short_summary_{ill}-scaffold-{spol}-{i}.txt", ill = ILL_ASM, spol = ILL_POL, i = ["1","2","3"])
    output: touch(".flags/3-met/busco-ill-pol.success")

# Nanopore

localrules: busco_nano_check_all, busco_nano_check_asm, busco_nano_check_pol_r1, busco_nano_check_pol_r2

rule busco_nano_check_all:
    input:
        ".flags/3-met/busco-nano-asm.success",
        ".flags/3-met/busco-nano-pol-r1.success",
        ".flags/3-met/busco-nano-pol-r2.success"
    output: touch(".flags/3-met/busco-nano-all.success")

rule busco_nano_check_asm:
    input:
        expand("3-metrics/busco/NANO/{nano}/run_{nano}-scaffold/short_summary_{nano}-scaffold.txt", nano = NANO_ASM)
    output: touch(".flags/3-met/busco-nano-asm.success")

rule busco_nano_check_pol_r1:
    input:
        expand("3-metrics/busco/NANO/{nano}/run_{nano}-scaffold-{spol}-{i}/short_summary_{nano}-scaffold-{spol}-{i}.txt", nano = NANO_ASM, spol = ILL_POL, i = ["1","2","3"]),
        expand("3-metrics/busco/NANO/{nano}/run_{nano}-scaffold-{lpol}-{j}/short_summary_{nano}-scaffold-{lpol}-{j}.txt", nano = NANO_ASM, lpol = NANO_POL, j = ["1","2","3","4"]),
        expand("3-metrics/busco/NANO/{nano}/run_{nano}-scaffold-{hpol}-{j}/short_summary_{nano}-scaffold-{hpol}-{j}.txt", nano = NANO_ASM, hpol = NANO_HYB_POL, j = ["1","2","3","4"])
    output: touch(".flags/3-met/busco-nano-pol-r1.success")

rule busco_nano_check_pol_r2:
    input:
        expand("3-metrics/busco/NANO/{nano}/run_{nano}-scaffold-{lpol}-4-{spol}-{i}/short_summary_{nano}-scaffold-{lpol}-4-{spol}-{i}.txt", nano = NANO_ASM, lpol = NANO_POL, spol = ILL_POL, i = ["1","2","3"])
    output: touch(".flags/3-met/busco-nano-pol-r2.success")

# PacBio

localrules: busco_pacbio_check_all, busco_pacbio_check_asm, busco_pacbio_check_pol_r1, busco_pacbio_check_pol_r2

rule busco_pacbio_check_all:
    input:
        ".flags/3-met/busco-pacbio-asm.success",
        ".flags/3-met/busco-pacbio-pol-r1.success",
        ".flags/3-met/busco-pacbio-pol-r2.success"
    output: touch(".flags/3-met/busco-pacbio-all.success")

rule busco_pacbio_check_asm:
    input:
        expand("3-metrics/busco/PACBIO/{pacbio}/run_{pacbio}-scaffold/short_summary_{pacbio}-scaffold.txt", pacbio = PACBIO_ASM)
    output: touch(".flags/3-met/busco-pacbio-asm.success")

rule busco_pacbio_check_pol_r1:
    input:
        expand("3-metrics/busco/PACBIO/{pacbio}/run_{pacbio}-scaffold-{spol}-{i}/short_summary_{pacbio}-scaffold-{spol}-{i}.txt", pacbio = PACBIO_ASM, spol = ILL_POL, i = ["1","2","3"]),
        expand("3-metrics/busco/PACBIO/{pacbio}/run_{pacbio}-scaffold-{lpol}-{j}/short_summary_{pacbio}-scaffold-{lpol}-{j}.txt", pacbio = PACBIO_ASM, lpol = PACBIO_POL, j = ["1","2","3","4"]),
        expand("3-metrics/busco/PACBIO/{pacbio}/run_{pacbio}-scaffold-{hpol}-{j}/short_summary_{pacbio}-scaffold-{hpol}-{j}.txt", pacbio = PACBIO_ASM, hpol = PACBIO_HYB_POL, j = ["1","2","3","4"])
    output: touch(".flags/3-met/busco-pacbio-pol-r1.success")

rule busco_pacbio_check_pol_r2:
    input:
        expand("3-metrics/busco/PACBIO/{pacbio}/run_{pacbio}-scaffold-{lpol}-4-{spol}-{i}/short_summary_{pacbio}-scaffold-{lpol}-4-{spol}-{i}.txt", pacbio = PACBIO_ASM, lpol = PACBIO_POL, spol = ILL_POL, i = ["1","2","3"])
    output: touch(".flags/3-met/busco-pacbio-pol-r2.success")

# Hybrid

localrules: busco_hyb_check_all, busco_hyb_check_asm, busco_hyb_check_pol_r1, busco_hyb_check_pol_r2

rule busco_hyb_check_all:
    input:
        ".flags/3-met/busco-hyb-asm.success",
        ".flags/3-met/busco-hyb-pol-r1.success",
        ".flags/3-met/busco-hyb-pol-r2.success"
    output: touch(".flags/3-met/busco-hyb-all.success")

rule busco_hyb_check_asm:
    input:
        expand("3-metrics/busco/HYB/{nhyb}/run_{nhyb}-scaffold/short_summary_{nhyb}-scaffold.txt", nhyb = NANO_HYB_ASM),
        expand("3-metrics/busco/HYB/{phyb}/run_{phyb}-scaffold/short_summary_{phyb}-scaffold.txt", phyb = PACBIO_HYB_ASM),
        expand("3-metrics/busco/HYB/{hhyb}/run_{hhyb}-scaffold/short_summary_{hhyb}-scaffold.txt", hhyb = HYB_ASM)
    output: touch(".flags/3-met/busco-hyb-asm.success")

rule busco_hyb_check_pol_r1:
    input:
        expand("3-metrics/busco/HYB/{nhyb}/run_{nhyb}-scaffold-{spol}-{i}/short_summary_{nhyb}-scaffold-{spol}-{i}.txt", nhyb = NANO_HYB_ASM, spol = ILL_POL, i = ["1","2","3"]),
        expand("3-metrics/busco/HYB/{nhyb}/run_{nhyb}-scaffold-{npol}-{j}/short_summary_{nhyb}-scaffold-{npol}-{j}.txt", nhyb = NANO_HYB_ASM, npol = NANO_POL, j = ["1","2","3","4"]),
        expand("3-metrics/busco/HYB/{nhyb}/run_{nhyb}-scaffold-{hpoln}-{j}/short_summary_{nhyb}-scaffold-{hpoln}-{j}.txt", nhyb = NANO_HYB_ASM, hpoln = NANO_HYB_POL, j = ["1","2","3","4"]),
        expand("3-metrics/busco/HYB/{phyb}/run_{phyb}-scaffold-{spol}-{i}/short_summary_{phyb}-scaffold-{spol}-{i}.txt", phyb = PACBIO_HYB_ASM, spol = ILL_POL, i = ["1","2","3"]),
        expand("3-metrics/busco/HYB/{phyb}/run_{phyb}-scaffold-{ppol}-{j}/short_summary_{phyb}-scaffold-{ppol}-{j}.txt", phyb = PACBIO_HYB_ASM, ppol = PACBIO_POL, j = ["1","2","3","4"]),
        expand("3-metrics/busco/HYB/{phyb}/run_{phyb}-scaffold-{hpolp}-{j}/short_summary_{phyb}-scaffold-{hpolp}-{j}.txt", phyb = PACBIO_HYB_ASM, hpolp = PACBIO_HYB_POL, j = ["1","2","3","4"]),
        expand("3-metrics/busco/HYB/{hhyb}/run_{hhyb}-scaffold-{spol}-{i}/short_summary_{hhyb}-scaffold-{spol}-{i}.txt", hhyb = HYB_ASM, spol = ILL_POL, i = ["1","2","3"]),
        expand("3-metrics/busco/HYB/{hhyb}/run_{hhyb}-scaffold-{lpol}-{j}/short_summary_{hhyb}-scaffold-{lpol}-{j}.txt", hhyb = HYB_ASM, lpol = LONG_HYB_POL, j = ["1","2","3","4"]),
        expand("3-metrics/busco/HYB/{hhyb}/run_{hhyb}-scaffold-{hpolh}-{j}/short_summary_{hhyb}-scaffold-{hpolh}-{j}.txt", hhyb = HYB_ASM, hpolh = HYB_HYB_POL, j = ["1","2","3","4"])
    output: touch(".flags/3-met/busco-hyb-pol-r1.success")

rule busco_hyb_check_pol_r2:
    input:
        expand("3-metrics/busco/HYB/{nhyb}/run_{nhyb}-scaffold-{npol}-4-{spol}-{i}/short_summary_{nhyb}-scaffold-{npol}-4-{spol}-{i}.txt", nhyb = NANO_HYB_ASM, npol = NANO_POL, spol = ILL_POL, i = ["1","2","3"]),
        expand("3-metrics/busco/HYB/{phyb}/run_{phyb}-scaffold-{ppol}-4-{spol}-{i}/short_summary_{phyb}-scaffold-{ppol}-4-{spol}-{i}.txt", phyb = PACBIO_HYB_ASM, ppol = PACBIO_POL, spol = ILL_POL, i = ["1","2","3"]),
        expand("3-metrics/busco/HYB/{hhyb}/run_{hhyb}-scaffold-{lpol}-4-{spol}-{i}/short_summary_{hhyb}-scaffold-{lpol}-4-{spol}-{i}.txt", hhyb = HYB_ASM, lpol = LONG_HYB_POL, spol = ILL_POL, i = ["1","2","3"])
    output: touch(".flags/3-met/busco-hyb-pol-r2.success")


### RED ###

localrules:
    red_check_all, red_ill_check_all, red_ill_check_asm, red_ill_check_pol,
    red_nano_check_all, red_nano_check_asm, red_nano_check_pol,
    red_pacbio_check_all, red_pacbio_check_asm, red_pacbio_check_pol,
    red_hyb_check_all, red_hyb_check_asm, red_nano_hyb_check_pol, red_pacbio_hyb_check_pol, red_hyb_hyb_check_pol

rule red_check_all:
    input:
        ".flags/3-met/red-ill-all.success",
        ".flags/3-met/red-nano-all.success",
        ".flags/3-met/red-pacbio-all.success",
        ".flags/3-met/red-hyb-all.success"
    output: touch(".flags/3-met/red-all.success")

## Illumina Assemblies

rule red_ill_check_all:
    input:
        ".flags/3-met/red-ill-asm.success",
        ".flags/3-met/red-ill-pol.success"
    output: touch(".flags/3-met/red-ill-all.success")

rule red_ill_check_asm:
    input:
        expand("3-metrics/red/ILL/{ill}/{ill}-scaffold/{ill}-scaffold.txt", ill = ILL_ASM)
    output: touch(".flags/3-met/red-ill-asm.success")

rule red_ill_check_pol:
    input:
        expand("3-metrics/red/ILL/{ill}/{ill}-scaffold-{pol}-{i}/{ill}-scaffold-{pol}-{i}.txt", ill = ILL_ASM, pol = ILL_POL, i = ["1","2","3"])
    output: touch(".flags/3-met/red-ill-pol.success")

## Nanopore Assemblies

rule red_nano_check_all:
    input:
        ".flags/3-met/red-nano-asm.success",
        ".flags/3-met/red-nano-pol.success"
    output: touch(".flags/3-met/red-nano-all.success")

rule red_nano_check_asm:
    input:
        expand("3-metrics/red/NANO/{nano}/{nano}-scaffold/{nano}-scaffold.txt", nano = NANO_ASM)
    output: touch(".flags/3-met/red-nano-asm.success")

rule red_nano_check_pol:
    input:
        expand("3-metrics/red/NANO/{nano}/{nano}-scaffold-{spol}-{i}/{nano}-scaffold-{spol}-{i}.txt", nano = NANO_ASM, spol = ILL_POL, i = ["1","2","3"]),
        expand("3-metrics/red/NANO/{nano}/{nano}-scaffold-{lpol}-{j}/{nano}-scaffold-{lpol}-{j}.txt", nano = NANO_ASM, lpol = NANO_POL, j = ["1","2","3","4"]),
        expand("3-metrics/red/NANO/{nano}/{nano}-scaffold-{lpol}-4-{spol}-{i}/{nano}-scaffold-{lpol}-4-{spol}-{i}.txt", nano = NANO_ASM, lpol = NANO_POL, spol = ILL_POL, i = ["1","2","3"]),
        expand("3-metrics/red/NANO/{nano}/{nano}-scaffold-{hpol}-{j}/{nano}-scaffold-{hpol}-{j}.txt", nano = NANO_ASM, hpol = NANO_HYB_POL, j = ["1","2","3","4"])
    output: touch(".flags/3-met/red-nano-pol.success")

## PacBio Assemblies

rule red_pacbio_check_all:
    input:
        ".flags/3-met/red-pacbio-asm.success",
        ".flags/3-met/red-pacbio-pol.success"
    output: touch(".flags/3-met/red-pacbio-all.success")

rule red_pacbio_check_asm:
    input:
        expand("3-metrics/red/PACBIO/{pacbio}/{pacbio}-scaffold/{pacbio}-scaffold.txt", pacbio = PACBIO_ASM)
    output: touch(".flags/3-met/red-pacbio-asm.success")

rule red_pacbio_check_pol:
    input:
        expand("3-metrics/red/PACBIO/{pacbio}/{pacbio}-scaffold-{spol}-{i}/{pacbio}-scaffold-{spol}-{i}.txt", pacbio = PACBIO_ASM, spol = ILL_POL, i = ["1","2","3"]),
        expand("3-metrics/red/PACBIO/{pacbio}/{pacbio}-scaffold-{lpol}-{j}/{pacbio}-scaffold-{lpol}-{j}.txt", pacbio = PACBIO_ASM, lpol = PACBIO_POL, j = ["1","2","3","4"]),
        expand("3-metrics/red/PACBIO/{pacbio}/{pacbio}-scaffold-{lpol}-4-{spol}-{i}/{pacbio}-scaffold-{lpol}-4-{spol}-{i}.txt", pacbio = PACBIO_ASM, lpol = PACBIO_POL, spol = ILL_POL, i = ["1","2","3"]),
        expand("3-metrics/red/PACBIO/{pacbio}/{pacbio}-scaffold-{hpol}-{j}/{pacbio}-scaffold-{hpol}-{j}.txt", pacbio = PACBIO_ASM, hpol = PACBIO_HYB_POL, j = ["1","2","3","4"])
    output: touch(".flags/3-met/red-pacbio-pol.success")

## Hybrid Assemblies

rule red_hyb_check_all:
    input:
        ".flags/3-met/red-hyb-asm.success",
        ".flags/3-met/red-nano-hyb-pol.success",
        ".flags/3-met/red-pacbio-hyb-pol.success",
        ".flags/3-met/red-hyb-hyb-pol.success"
    output: touch(".flags/3-met/red-hyb-all.success")

rule red_hyb_check_asm:
    input:
        expand("3-metrics/red/HYB/{nhyb}/{nhyb}-scaffold/{nhyb}-scaffold.txt", nhyb = NANO_HYB_ASM),
        expand("3-metrics/red/HYB/{phyb}/{phyb}-scaffold/{phyb}-scaffold.txt", phyb = PACBIO_HYB_ASM),
        expand("3-metrics/red/HYB/{hhyb}/{hhyb}-scaffold/{hhyb}-scaffold.txt", hhyb = HYB_ASM)
    output: touch(".flags/3-met/red-hyb-asm.success")

rule red_nano_hyb_check_pol:
    input:
        expand("3-metrics/red/HYB/{nano}/{nano}-scaffold-{spol}-{i}/{nano}-scaffold-{spol}-{i}.txt", nano = NANO_HYB_ASM, spol = ILL_POL, i = ["1","2","3"]),
        expand("3-metrics/red/HYB/{nano}/{nano}-scaffold-{lpol}-{j}/{nano}-scaffold-{lpol}-{j}.txt", nano = NANO_HYB_ASM, lpol = NANO_POL, j = ["1","2","3","4"]),
        expand("3-metrics/red/HYB/{nano}/{nano}-scaffold-{lpol}-4-{spol}-{i}/{nano}-scaffold-{lpol}-4-{spol}-{i}.txt", nano = NANO_HYB_ASM, lpol = NANO_POL, spol = ILL_POL, i = ["1","2","3"]),
        expand("3-metrics/red/HYB/{nano}/{nano}-scaffold-{hpol}-{j}/{nano}-scaffold-{hpol}-{j}.txt", nano = NANO_HYB_ASM, hpol = NANO_HYB_POL, j = ["1","2","3","4"])
    output: touch(".flags/3-met/red-nano-hyb-pol.success")

rule red_pacbio_hyb_check_pol:
    input:
        expand("3-metrics/red/HYB/{pacbio}/{pacbio}-scaffold-{spol}-{i}/{pacbio}-scaffold-{spol}-{i}.txt", pacbio = PACBIO_HYB_ASM, spol = ILL_POL, i = ["1","2","3"]),
        expand("3-metrics/red/HYB/{pacbio}/{pacbio}-scaffold-{lpol}-{j}/{pacbio}-scaffold-{lpol}-{j}.txt", pacbio = PACBIO_HYB_ASM, lpol = PACBIO_POL, j = ["1","2","3","4"]),
        expand("3-metrics/red/HYB/{pacbio}/{pacbio}-scaffold-{lpol}-4-{spol}-{i}/{pacbio}-scaffold-{lpol}-4-{spol}-{i}.txt", pacbio = PACBIO_HYB_ASM, lpol = PACBIO_POL, spol = ILL_POL, i = ["1","2","3"]),
        expand("3-metrics/red/HYB/{pacbio}/{pacbio}-scaffold-{hpol}-{j}/{pacbio}-scaffold-{hpol}-{j}.txt", pacbio = PACBIO_HYB_ASM, hpol = PACBIO_HYB_POL, j = ["1","2","3","4"])
    output: touch(".flags/3-met/red-pacbio-hyb-pol.success")

rule red_hyb_hyb_check_pol:
    input:
        expand("3-metrics/red/HYB/{hyb}/{hyb}-scaffold-{spol}-{i}/{hyb}-scaffold-{spol}-{i}.txt", hyb = HYB_ASM, spol = ILL_POL, i = ["1","2","3"]),
        expand("3-metrics/red/HYB/{hyb}/{hyb}-scaffold-{lpol}-{j}/{hyb}-scaffold-{lpol}-{j}.txt", hyb = HYB_ASM, lpol = LONG_HYB_POL, j = ["1","2","3","4"]),
        expand("3-metrics/red/HYB/{hyb}/{hyb}-scaffold-{lpol}-4-{spol}-{i}/{hyb}-scaffold-{lpol}-4-{spol}-{i}.txt", hyb = HYB_ASM, lpol = LONG_HYB_POL, spol = ILL_POL, i = ["1","2","3"]),
        expand("3-metrics/red/HYB/{hyb}/{hyb}-scaffold-{hpol}-{j}/{hyb}-scaffold-{hpol}-{j}.txt", hyb = HYB_ASM, hpol = HYB_HYB_POL, j = ["1","2","3","4"])
    output: touch(".flags/3-met/red-hyb-hyb-pol.success")

### BUSCOMP ###

localrules:
    buscomp_check_all, buscomp_check_asm, buscomp_ill_check_all, buscomp_ill_check_asm, buscomp_ill_check_pol,
    buscomp_nano_check_all, buscomp_nano_check_asm, buscomp_nano_check_pol,
    buscomp_pacbio_check_all, buscomp_pacbio_check_asm, buscomp_pacbio_check_pol,
    buscomp_hyb_check_all, buscomp_hyb_check_asm, buscomp_nano_hyb_check_pol, buscomp_pacbio_hyb_check_pol, buscomp_hyb_hyb_check_pol

rule buscomp_check_all:
    input:
        ".flags/3-met/buscomp-ill-all.success",
        ".flags/3-met/buscomp-nano-all.success",
        ".flags/3-met/buscomp-pacbio-all.success",
        ".flags/3-met/buscomp-hyb-all.success"
    output: touch(".flags/3-met/buscomp-all.success")

rule buscomp_check_asm:
    input:
        ".flags/3-met/buscomp-ill-asm.success",
        ".flags/3-met/buscomp-nano-asm.success",
        ".flags/3-met/buscomp-pacbio-asm.success",
        ".flags/3-met/buscomp-hyb-asm.success"
    output: touch(".flags/3-met/buscomp-asm-all.success")

# Illumina Assemblies ##

rule buscomp_ill_check_all:
    input:
        ".flags/3-met/buscomp-ill-asm.success",
        ".flags/3-met/buscomp-ill-pol.success"
    output: touch(".flags/3-met/buscomp-ill-all.success")

rule buscomp_ill_check_asm:
    input:
        "3-metrics/buscomp/ILL/ill-asm-comparison/buscomp-ratings.tdt"
    output: touch(".flags/3-met/buscomp-ill-asm.success")

rule buscomp_ill_check_pol:
    input:
        expand("3-metrics/buscomp/ILL/{ill}/{ill}-scaffold-short/buscomp-ratings.tdt", ill = ILL_ASM)
    output: touch(".flags/3-met/buscomp-ill-pol.success")

## Nanopore Assemblies ##

rule buscomp_nano_check_all:
    input:
        ".flags/3-met/buscomp-nano-asm.success",
        ".flags/3-met/buscomp-nano-pol.success"
    output: touch(".flags/3-met/buscomp-nano-all.success")

rule buscomp_nano_check_asm:
    input:
        "3-metrics/buscomp/NANO/nano-asm-comparison/buscomp-ratings.tdt"
    output: touch(".flags/3-met/buscomp-nano-asm.success")

rule buscomp_nano_check_pol:
    input:
        expand("3-metrics/buscomp/NANO/{nano}/{nano}-scaffold-{size}/buscomp-ratings.tdt", nano = NANO_ASM, size = ["short", "long", "long-short", "hyb"])
    output: touch(".flags/3-met/buscomp-nano-pol.success")

## PacBio Assemblies ##

rule buscomp_pacbio_check_all:
    input:
        ".flags/3-met/buscomp-pacbio-asm.success",
        ".flags/3-met/buscomp-pacbio-pol.success"
    output: touch(".flags/3-met/buscomp-pacbio-all.success")

rule buscomp_pacbio_check_asm:
    input:
        "3-metrics/buscomp/PACBIO/pacbio-asm-comparison/buscomp-ratings.tdt"
    output: touch(".flags/3-met/buscomp-pacbio-asm.success")

rule buscomp_pacbio_check_pol:
    input:
        expand("3-metrics/buscomp/PACBIO/{pacbio}/{pacbio}-scaffold-{size}/buscomp-ratings.tdt", pacbio = PACBIO_ASM, size = ["short", "long", "long-short", "hyb"])
    output: touch(".flags/3-met/buscomp-pacbio-pol.success")

## Hybrid Assemblies ##

rule buscomp_hyb_check_all:
    input:
        ".flags/3-met/buscomp-hyb-asm.success",
        ".flags/3-met/buscomp-nano-hyb-pol.success",
        ".flags/3-met/buscomp-pacbio-hyb-pol.success",
        ".flags/3-met/buscomp-hyb-hyb-pol.success"
    output: touch(".flags/3-met/buscomp-hyb-all.success")

rule buscomp_hyb_check_asm:
    input:
        "3-metrics/buscomp/HYB/nano-hyb-asm-comparison/buscomp-ratings.tdt",
        "3-metrics/buscomp/HYB/pacbio-hyb-asm-comparison/buscomp-ratings.tdt",
        "3-metrics/buscomp/HYB/hyb-hyb-asm-comparison/buscomp-ratings.tdt"
    output: touch(".flags/3-met/buscomp-hyb-asm.success")

rule buscomp_nano_hyb_check_pol:
    input:
        expand("3-metrics/buscomp/HYB/{nhyb}/{nhyb}-scaffold-{size}/buscomp-ratings.tdt", nhyb = NANO_HYB_ASM, size = ["short", "long", "long-short", "hyb"])
    output: touch(".flags/3-met/buscomp-nano-hyb-pol.success")

rule buscomp_pacbio_hyb_check_pol:
    input:
        expand("3-metrics/buscomp/HYB/{phyb}/{phyb}-scaffold-{size}/buscomp-ratings.tdt", phyb = PACBIO_HYB_ASM, size = ["short", "long", "long-short", "hyb"])
    output: touch(".flags/3-met/buscomp-pacbio-hyb-pol.success")

rule buscomp_hyb_hyb_check_pol:
    input:
        expand("3-metrics/buscomp/HYB/{hhyb}/{hhyb}-scaffold-{size}/buscomp-ratings.tdt", hhyb = HYB_ASM, size = ["short", "long", "long-short", "hyb"])
    output: touch(".flags/3-met/buscomp-hyb-hyb-pol.success")


#####################
# Rules for Results #
#####################

rule results_write_all:
    input:
        ".flags/4-res/results-write-ill.success",
        ".flags/4-res/results-write-nano.success",
        ".flags/4-res/results-write-pacbio.success",
        ".flags/4-res/results-write-hyb.success"
    output: touch(".flags/4-res/results-write-all.success")

rule results_combine_all:
    input:
        ".flags/4-res/results-write-all.success",
        "4-results/pyro-results.csv"
    output: touch(".flags/4-res/results-combine-all.success")

# Illumina

rule results_write_ill:
    input:
        expand("4-results/ILL/{name}-results.csv", name = glob_wildcards("2-polishing/ILL/{name}.fa")[0])
    output: touch(".flags/4-res/results-write-ill.success")

# Nanopore

rule results_write_nano:
    input:
        expand("4-results/NANO/{name}-results.csv", name = glob_wildcards("2-polishing/NANO/{name}.fa")[0])
    output: touch(".flags/4-res/results-write-nano.success")

# PacBio

rule results_write_pacbio:
    input:
        expand("4-results/PACBIO/{name}-results.csv", name = glob_wildcards("2-polishing/PACBIO/{name}.fa")[0])
    output: touch(".flags/4-res/results-write-pacbio.success")

# Hybrid

rule results_write_hyb:
    input:
        expand("4-results/HYB/{name}-results.csv", name = glob_wildcards("2-polishing/HYB/{name}.fa")[0])
    output: touch(".flags/4-res/results-write-hyb.success")
