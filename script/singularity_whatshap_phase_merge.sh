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

INPUT_DIR=$PWD/split/whatshap/${SAMPLE}
OUTPUT_VCF=$PWD/whatshap/${SAMPLE}/phased.vcf

${CONF_SINGLARITY_PATH} exec ${CONF_WHATSHAP_PHASE_MERGE_SINGULARITY_OPTION} \
    ${CONF_WHATSHAP_PHASE_MERGE_IMG} \
    /bin/bash ${CONF_SCRIPT_PATH}/vcf_merge.sh \
    ${INPUT_DIR} \
    phased.vcf.gz \
    ${OUTPUT_VCF} \
