#!/bin/bash

input=$1

zcat $input | paste - - - - | cut -f 2 | tr -d '\n' | wc -c
