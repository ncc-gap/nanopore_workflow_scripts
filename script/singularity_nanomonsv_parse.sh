#!/bin/bash -x
#$ -S /bin/bash
#$ -cwd
#$ -o log
#$ -e log
#$ -j y
#$ -l s_vmem=24G
set -eux

SAMPLE=$1

source ./conf/param.sh

INPUT_BAM=$PWD/whatshap/${SAMPLE}/${SAMPLE}.bam
OUTPUT_PREFIX=$PWD/nanomonsv/${SAMPLE}/${SAMPLE}

${CONF_SINGLARITY_PATH} exec ${CONF_NANOMONSV_PARSE_SINGULARITY_OPTION} \
    ${CONF_NANOMONSV_PARSE_IMG} \
    /bin/bash ${CONF_SCRIPT_PATH}/nanomonsv_parse.sh \
    ${INPUT_BAM} \
    ${OUTPUT_PREFIX}
