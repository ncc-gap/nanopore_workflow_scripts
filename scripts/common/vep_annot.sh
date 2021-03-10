#!/bin/bash -x

INPUT_VCF=$1
OUTPUT_VCF=$2

DIR_CACHE=/home/aokada/nanopore/database/vep_data
GNOMAD=/home/aokada/nanopore/database/gnomad/gnomad.genomes.r3.0.sites.vcf.bgz
REFERENCE=/home/aokada/nanopore/database/broad/hg38/v0/Homo_sapiens_assembly38.fasta

mkdir -p $(dirname ${OUTPUT_VCF})

/opt/vep/src/ensembl-vep/vep \
-i ${INPUT_VCF} \
-o ${OUTPUT_VCF} \
--dir_cache ${DIR_CACHE} \
--dir_plugins ${DIR_CACHE}/Plugins \
--force_overwrite --vcf --verbose --cache --offline --refseq --minimal \
--assembly GRCh38 \
--fasta ${REFERENCE} \
--custom ${GNOMAD},gnomADg,vcf,exact,0,AF,AF_eas \
--fork 4 

bgzip -f ${OUTPUT_VCF}
tabix -p vcf ${OUTPUT_VCF}.gz
