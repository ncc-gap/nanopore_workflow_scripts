#!/bin/bash -x
set -x
set -o errexit
set -o nounset

INPUT_PHASED_VCF=$1
INPUT_BAM=$2
OUTPUT_DIR=$3

REFERENCE=/home/aokada/nanopore/database/broad/hg38/v0/Homo_sapiens_assembly38.fasta

mkdir -p ${OUTPUT_DIR}

whatshap haplotag \
 -o ${OUTPUT_DIR}/haplotag.bam \
 --reference ${REFERENCE} \
 --ignore-read-groups \
 --output-haplotag-list ${OUTPUT_DIR}/haplotag.txt \
 ${INPUT_PHASED_VCF} \
 ${INPUT_BAM}
