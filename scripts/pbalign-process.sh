#!/bin/bash

mkdir -p $2
i=0
for bam in $( ls ../../../../reads/PACBIO/pacbio-bam/*.subreads.bam );
do
  echo "Processing file "$bam
  pbalign --nproc $3 $bam $1 $2/$2"-align-"$i".bam";
  i=$((i+1));
done

