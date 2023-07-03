#!/bin/bash -x
set -eux -o pipefail

INPUT_BAM=$1
OUTPUT=$2
REFERENCE=$3
CHR=$4
SAMTOOLS_PATH=$5

fisher single \
    -1 ${INPUT_BAM} \
    -o ${OUTPUT}/${CHR}.vcf \
    -O vcf \
    -a ${CHR} \
    -r ${REFERENCE} \
    -R ${CHR} \
    -s ${SAMTOOLS_PATH} \
    -m 0.07 \
    -d 10 \
    -v 4 \
    -S "-q 30 -BQ0 -d 100000000" \
    -e

bgzip -f ${OUTPUT}/${CHR}.vcf
tabix -f -p vcf ${OUTPUT}/${CHR}.vcf.gz