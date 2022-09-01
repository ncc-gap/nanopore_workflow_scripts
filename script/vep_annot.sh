#!/bin/bash -x
set -eux -o pipefail

INPUT_VCF=$1
OUTPUT_VCF=$2
REFERENCE=$3
DIR_CACHE=$4
PLUGINS=$5
GNOMAD=$6

mkdir -p $(dirname ${OUTPUT_VCF})

/opt/vep/src/ensembl-vep/vep \
-i ${INPUT_VCF} \
-o ${OUTPUT_VCF} \
--format vcf \
--dir_cache ${DIR_CACHE} \
--dir_plugins ${PLUGINS} \
--force_overwrite --vcf --verbose --cache --offline --minimal --var_synonyms --merged --hgvs --hgvsg --no_escape --mane \
--assembly GRCh38 --fasta ${REFERENCE} \
--custom ${GNOMAD},gnomADg,vcf,exact,0,AF,AF_eas \

bgzip -f ${OUTPUT_VCF}
tabix -p vcf ${OUTPUT_VCF}.gz
