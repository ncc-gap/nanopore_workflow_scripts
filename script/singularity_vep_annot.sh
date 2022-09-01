#!/bin/bash -x
#$ -S /bin/bash
#$ -cwd
#$ -o log
#$ -e log
#$ -j y
#$ -l s_vmem=4G
set -eux

SAMPLE=$1
CHR=$2

source ./conf/param.sh

INPUT_VCF=$PWD/split/PMDV/${SAMPLE}/${CHR}/PMDV.vcf.gz
OUTPUT_VCF=$PWD/split/vep/${SAMPLE}/${CHR}/PMDV.annot.vcf

${CONF_SINGLARITY_PATH} exec ${CONF_VEP_ANNOT_SINGULARITY_OPTION} \
    ${CONF_VEP_ANNOT_IMG} \
    /bin/bash $PWD/script/vep_annot.sh \
    ${INPUT_VCF} \
    ${OUTPUT_VCF} \
    ${CONF_VEP_ANNOT_REFERENCE} \
    ${CONF_VEP_ANNOT_DIR_CACHE} \
    ${CONF_VEP_ANNOT_PLUGINS} \
    ${CONF_VEP_ANNOT_GNOMAD}
