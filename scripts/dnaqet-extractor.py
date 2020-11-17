import sys, getopt, os, glob

# Set current working directory
cwd = os.getcwd()

# Get arguments
all_arguments = sys.argv

# Get rid of file name arg
arg_list = all_arguments[1:]
num_arguments = len(arg_list)

# Set up command argument options for getopt
short_options = "a:t:m:h"
long_options = ["asm", "tag", "metric", "help"]

# Set help/usage string output
usage_str = "results-extractor.py Usage: \npython results-extractor.py -a <assembler> -t <tag> -m <metric>."

# Make sure arguments are valid
try:
    args, vals = getopt.getopt(arg_list, short_options, long_options)
except getopt.error as err:
    # Output error, return error code
    print ("Error: " + str(err))
    print (usage_str)
    sys.exit(2)

# Set some defaults
asm = ""
tag = ""
metric = ""

# Set or override some parameters from arguments
for cur_arg, cur_val in args:
    if cur_arg in ("-a", "--asm"):
        asm = cur_val
    elif cur_arg in ("-t", "--tag"):
        tag = cur_val
    elif cur_arg in ("-m", "--metric"):
        metric = cur_val
    elif cur_arg in ("-h", "--help"):
        print (usage_str)
        sys.exit(2)

infile = "/scratch1/sou085/orgs/cele/metrics/dnaqet/abyss/abyss-ill-scaffold/reports/assembly.stat"
trigger = "Final quality score for the assembly= "
with open(infile, "r") as f:
    for line in f:
        rec = line.strip()
        if rec.startswith(trigger):
            pre_val = rec
    val = float(pre_val.replace(trigger,""))
    pct = val*100
    print(val)
    print(pct)
