#!/usr/bin/python

"""
This script calculates the LG values at various thresholds (1-100%) for the given input genome assembly.

Usage: python3/Python-3.6.4/python NG.py <genome assembly file (fasta format)> <output prefix> 

"""

from Bio import SeqIO

import sys

import statistics

import numpy as np



inputfile = sys.argv[1] 
prefix = sys.argv[2]

lenfile = "{}-len.txt".format(prefix)
fragfile = "{}-frag.txt".format(prefix)

with open(fragfile, "w") as f, open(lenfile, "w") as l:
    records = list(SeqIO.parse(inputfile, "fasta"))
    len_seq = [len(rec) for rec in records]
    sorted_len = sorted(len_seq, reverse=True)
    frags = len(records)
    
    fragno = 1
    cur_len = 0
    for contig in sorted_len: 
        f.append(fragno)
        cur_len += len(contig)
        l.append(cur_len)
        fragno += 1
        

