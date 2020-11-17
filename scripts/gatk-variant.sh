#!/bin/bash 
#input.asm=1, output.bam = 2, output.vcf = 3
bcftools mpileup -Ou -f $1 $2 | bcftools call -Ou -mv | bcftools filter -s LowQual -e '%QUAL<20 || DP>100' -o $3
