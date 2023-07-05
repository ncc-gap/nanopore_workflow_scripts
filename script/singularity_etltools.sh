#!/bin/bash -x
#$ -S /bin/bash
#$ -cwd
#$ -o log
#$ -e log
#$ -j y
#$ -l s_vmem=16G
#$ -pe def_slot 8
set -eux

source ./conf/param.sh

SAMPLE=$1
INPUT_BAM=$2
MERGE_TAG_INPUT_BAM=$PWD/whatshap/${SAMPLE}/${SAMPLE}.bam
OUTPUT_DIR=$PWD/methylation/${SAMPLE}
${CONF_SINGLARITY_PATH} exec ${CONF_etltools_IMG} \
    ${CONF_etltools_SINGULARITY_OPTION} \
    /bin/bash ${CONF_SCRIPT_PATH}/etltools.sh \
    ${INPUT_BAM} \
    ${MERGE_TAG_INPUT_BAM} \
    ${OUTPUT_DIR} \
    ${CONF_etltools_REFERENCE} \
    ${SAMPLE}

