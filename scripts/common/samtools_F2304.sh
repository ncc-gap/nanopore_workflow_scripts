#!/bin/bash -x
set -x
set -o errexit
set -o nounset

INPUT_BAM=$1
OUTPUT_BAM=$2

mkdir -p $(dirname ${OUTPUT_BAM})
samtools view -F 2304 -b -h -@ 8 -m 2G  ${INPUT_BAM} > ${OUTPUT_BAM}
samtools index ${OUTPUT_BAM}

