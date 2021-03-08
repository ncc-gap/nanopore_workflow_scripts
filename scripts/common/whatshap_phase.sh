#!/bin/bash -x
set -x
set -o errexit
set -o nounset

INPUT_VCF=$1
INPUT_BAM=$2
OUTPUT_DIR=$3

REFERENCE=/home/aokada/nanopore/database/broad/hg38/v0/Homo_sapiens_assembly38.fasta

mkdir -p ${OUTPUT_DIR}

whatshap phase \
 -o ${OUTPUT_DIR}/phased.vcf \
 --reference=${REFERENCE} \
 --ignore-read-groups \
 ${INPUT_VCF} \
 ${INPUT_BAM}

rm -f ${OUTPUT_VCF}.gz
bgzip ${OUTPUT_DIR}/phased.vcf
tabix -p vcf ${OUTPUT_DIR}/phased.vcf.gz
