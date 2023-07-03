#!/bin/bash -x
set -eux -o pipefail

INPUT_BAM=$1
OUTPUT_DIR=$2
CHR=$3
REFERENCE=$4
DATA=$5

rm -rf ${OUTPUT_DIR}
mkdir -p ${OUTPUT_DIR}
if [ $DATA = "ONT_R9" ];
then
    run_pepper_margin_deepvariant call_variant \
        -b ${INPUT_BAM} \
        -f ${REFERENCE} \
        -o ${OUTPUT_DIR} \
        -r "${CHR}" \
        -p PMDV \
        -t 8 \
        --ont_r9_guppy5_sup
elif [ $DATA = "ONT_R10" ];
then
    run_pepper_margin_deepvariant call_variant \
        -b ${INPUT_BAM} \
        -f ${REFERENCE} \
        -o ${OUTPUT_DIR} \
        -r "${CHR}" \
        -p PMDV \
        -t 8 \
        --ont_r10_q20
else
    run_pepper_margin_deepvariant call_variant \
        -b ${INPUT_BAM} \
        -f ${REFERENCE} \
        -o ${OUTPUT_DIR} \
        -r "${CHR}" \
        -p PMDV \
        -t 8 \
        --hifi
fi
