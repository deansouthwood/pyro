#!/bin/bash 

awk '$1 ~/S/ {print ">"$2"\n"$3}' $1 > $2
