#!/usr/bin/env python
from Bio import SeqIO
import os
import sys
import seaborn as sns
import pandas as pd
import matplotlib.pyplot as plt

if(len(sys.argv) < 2):
	exit("Usage: python contigPlot.py folderName. \n Name of folder containing genomes should be specified")

out = open("contigLength.txt","w")

for fastaFile in os.listdir(sys.argv[1]):
    if(fastaFile.endswith(".fasta")):
            for record in SeqIO.parse(sys.argv[1] + "/" +fastaFile,"fasta"):
                seqLength = len(str(record.seq))/1000
                out.write(str(seqLength) + "," + fastaFile[:-6] + "\n")
out.close()
csv = pd.read_csv("contigLength.txt",header=None)

# Draw the density plot
ax = sns.distplot(csv[0], hist = False, kde = True,kde_kws = {'linewidth': 3})
#fig = plt.figure()
ax.set(xlabel='contig lengths (Kb)')
plt.subplots_adjust(left=0.2)
plt.savefig("contigLength_DensityPlot",dpi=600)