#!/bin/bash -x
set -eux -o pipefail

INPUT_DIR=$1
BASENAME=$2
OUTPUT_TSV=$3

head -n 1 ${INPUT_DIR}/chr1/${BASENAME} > ${OUTPUT_TSV}
tail -n +2 ${INPUT_DIR}/chr1/${BASENAME} >> ${OUTPUT_TSV}
tail -n +2 ${INPUT_DIR}/chr2/${BASENAME} >> ${OUTPUT_TSV}
tail -n +2 ${INPUT_DIR}/chr3/${BASENAME} >> ${OUTPUT_TSV}
tail -n +2 ${INPUT_DIR}/chr4/${BASENAME} >> ${OUTPUT_TSV}
tail -n +2 ${INPUT_DIR}/chr5/${BASENAME} >> ${OUTPUT_TSV}
tail -n +2 ${INPUT_DIR}/chr6/${BASENAME} >> ${OUTPUT_TSV}
tail -n +2 ${INPUT_DIR}/chr7/${BASENAME} >> ${OUTPUT_TSV}
tail -n +2 ${INPUT_DIR}/chr8/${BASENAME} >> ${OUTPUT_TSV}
tail -n +2 ${INPUT_DIR}/chr9/${BASENAME} >> ${OUTPUT_TSV}
tail -n +2 ${INPUT_DIR}/chr10/${BASENAME} >> ${OUTPUT_TSV}
tail -n +2 ${INPUT_DIR}/chr11/${BASENAME} >> ${OUTPUT_TSV}
tail -n +2 ${INPUT_DIR}/chr12/${BASENAME} >> ${OUTPUT_TSV}
tail -n +2 ${INPUT_DIR}/chr13/${BASENAME} >> ${OUTPUT_TSV}
tail -n +2 ${INPUT_DIR}/chr14/${BASENAME} >> ${OUTPUT_TSV}
tail -n +2 ${INPUT_DIR}/chr15/${BASENAME} >> ${OUTPUT_TSV}
tail -n +2 ${INPUT_DIR}/chr16/${BASENAME} >> ${OUTPUT_TSV}
tail -n +2 ${INPUT_DIR}/chr17/${BASENAME} >> ${OUTPUT_TSV}
tail -n +2 ${INPUT_DIR}/chr18/${BASENAME} >> ${OUTPUT_TSV}
tail -n +2 ${INPUT_DIR}/chr19/${BASENAME} >> ${OUTPUT_TSV}
tail -n +2 ${INPUT_DIR}/chr20/${BASENAME} >> ${OUTPUT_TSV}
tail -n +2 ${INPUT_DIR}/chr21/${BASENAME} >> ${OUTPUT_TSV}
tail -n +2 ${INPUT_DIR}/chr22/${BASENAME} >> ${OUTPUT_TSV}
tail -n +2 ${INPUT_DIR}/chrX/${BASENAME} >> ${OUTPUT_TSV}
tail -n +2 ${INPUT_DIR}/chrY/${BASENAME} >> ${OUTPUT_TSV}
bgzip -f ${OUTPUT_TSV}
