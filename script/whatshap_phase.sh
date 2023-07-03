#!/bin/bash -x
set -eux -o pipefail

INPUT_VCF=$1
INPUT_BAM=$2
OUTPUT_VCF=$3
REFERENCE=$4

mkdir -p $(dirname ${OUTPUT_VCF})

whatshap phase \
    -o ${OUTPUT_VCF} \
    --reference=${REFERENCE} \
    --ignore-read-groups \
    ${INPUT_VCF} \
    ${INPUT_BAM}

bgzip -f ${OUTPUT_VCF}
tabix -p vcf ${OUTPUT_VCF}.gz
