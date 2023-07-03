#!/bin/bash -x
#$ -S /bin/bash
#$ -cwd
#$ -o log
#$ -e log
#$ -j y
#$ -l s_vmem=4G
set -eux

SAMPLE=$1

source ./conf/param.sh

INPUT_DIR=$PWD/split/vep/${SAMPLE}
OUTPUT_VCF=$PWD/vep/${SAMPLE}/PMDV.annot.vcf

${CONF_SINGLARITY_PATH} exec ${CONF_VEP_ANNOT_MERGE_SINGULARITY_OPTION} \
    ${CONF_VEP_ANNOT_MERGE_IMG} \
    /bin/bash ${CONF_SCRIPT_PATH}/vcf_merge.sh \
    ${INPUT_DIR} \
    PMDV.annot.vcf.gz \
    ${OUTPUT_VCF} \
