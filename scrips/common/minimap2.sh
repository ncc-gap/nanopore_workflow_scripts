#!/bin/bash -x
set -x
set -o errexit
set -o nounset

INPUT_FQ=$1
OUTPUT_DIR=$2
SAMPLE=$3

REFERENCE=/home/aiokada/GRCh38.d1.vd1/GRCh38.d1.vd1.fa

OUTPUT_BAM=${OUTPUT_DIR}/${SAMPLE}.bam

mkdir -p ${OUTPUT_DIR}
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

