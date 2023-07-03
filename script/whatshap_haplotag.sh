#!/bin/bash -x
set -eux -o pipefail

INPUT_PHASED_VCF=$1
INPUT_BAM=$2
OUTPUT_BAM=$3
OUTPUT_FILE=$4
REFERENCE=$5

mkdir -p $(dirname ${OUTPUT_BAM})

whatshap haplotag \
    -o ${OUTPUT_BAM} \
    --reference ${REFERENCE} \
    --ignore-read-groups \
    --output-haplotag-list ${OUTPUT_FILE} \
    ${INPUT_PHASED_VCF} \
    ${INPUT_BAM}

samtools index ${OUTPUT_BAM}
