#!/bin/bash -x
set -eux -o pipefail

INPUT_FQ=$1
OUTPUT_BAM=$2
REFERENCE=$3
DATA=$4

mkdir -p $(dirname ${OUTPUT_BAM})
if [ $DATA = "HiFi" ];
then
    minimap2 \
        -ax map-hifi \
        -t 8 \
        -p 0.1 \
        ${REFERENCE} \
        ${INPUT_FQ} | samtools view -Shb > ${OUTPUT_BAM}.unsorted
# TODO: Further consideration: ONT is optimizing the minimap2 parameter for R10.4.1
#elif [ $DATA = "ONT_R10" ];
#then
#    minimap2 \
#        -ax  \
#        -t 8 \
#        -p 0.1 \
#        ${REFERENCE} \
#        ${INPUT_FQ} | samtools view -Shb > ${OUTPUT_BAM}.unsorted
else
    minimap2 \
        -ax map-ont \
        -t 8 \
        -p 0.1 \
        ${REFERENCE} \
        ${INPUT_FQ} | samtools view -Shb > ${OUTPUT_BAM}.unsorted
fi

samtools sort \
    -@ 8 \
    -m 2G \
    ${OUTPUT_BAM}.unsorted \
    -o ${OUTPUT_BAM}

samtools index ${OUTPUT_BAM}

rm -rf ${OUTPUT_BAM}.unsorted

