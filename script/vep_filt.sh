#!/bin/bash -x
set -eux -o pipefail

INPUT_VCF=$1
OUTPUT_VCF=$2

python3 $PWD/script/filter_gnomad_simple.py \
${INPUT_VCF} \
${OUTPUT_VCF} \
0.001

bgzip -f ${OUTPUT_VCF}
tabix -p vcf ${OUTPUT_VCF}.gz
