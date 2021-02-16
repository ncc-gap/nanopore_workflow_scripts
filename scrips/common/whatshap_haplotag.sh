#!/bin/bash -x
set -x
set -o errexit
set -o nounset

INPUT_PHASED_VCF=$1
INPUT_BAM=$2
OUTPUT_DIR=$3

REFERENCE=/home/aiokada/GRCh38.d1.vd1/GRCh38.d1.vd1.fa

mkdir -p ${OUTPUT_DIR}

whatshap haplotag \
 -o ${OUTPUT_DIR}/haplotag.bam \
 --reference ${REFERENCE} \
 --ignore-read-groups \
 --output-haplotag-list ${OUTPUT_DIR}/haplotag.txt \
 ${INPUT_PHASED_VCF} \
 ${INPUT_BAM}
