#!/bin/bash -x

FILT_SCRIPT=$1
INPUT_VCF=$2
OUTPUT_PREFIX=$3
THRES=$4

OUTPUT_VCF=${OUTPUT_PREFIX}round_1.vcf

python ${FILT_SCRIPT} \
${INPUT_VCF} \
${OUTPUT_VCF} \
${THRES}

rm -f ${OUTPUT_VCF}.gz
bgzip ${OUTPUT_VCF}
tabix -p vcf ${OUTPUT_VCF}.gz
