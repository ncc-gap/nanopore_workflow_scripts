#!/bin/bash -x
set -eux -o pipefail

INPUT_FQ=$1
OUTPUT_BAM=$2
REFERENCE=$3

mkdir -p $(dirname ${OUTPUT_BAM})
minimap2 \
    -ax map-ont \
    -t 8 \
    -p 0.1 \
    ${REFERENCE} \
    ${INPUT_FQ} | samtools view -Shb > ${OUTPUT_BAM}.unsorted

samtools sort \
    -@ 8 \
    -m 2G \
    ${OUTPUT_BAM}.unsorted \
    -o ${OUTPUT_BAM}

samtools index ${OUTPUT_BAM}

rm -rf ${OUTPUT_BAM}.unsorted

