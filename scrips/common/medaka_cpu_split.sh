#!/bin/bash -x
set -x
set -o errexit
set -o nounset

INPUT_BAM=$1
OUTPUT_DIR=$2
CHR=$3

REFERENCE=/home/aokada/nanopore/database/broad/hg38/v0/Homo_sapiens_assembly38.fasta

OUTPUT_DIR=${OUTPUT_DIR}/${CHR}

rm -rf ${OUTPUT_DIR}
mkdir -p ${OUTPUT_DIR}
medaka_variant \
-f ${REFERENCE} \
-i ${INPUT_BAM} \
-t 2 \
-r ${CHR} \
-m r941_prom_high_g344 \
-s r941_prom_high_g344 \
-o ${OUTPUT_DIR}

bgzip ${OUTPUT_DIR}/round_1.vcf
tabix -p vcf ${OUTPUT_DIR}/round_1.vcf.gz

