#!/bin/bash -x
#$ -S /bin/bash
#$ -cwd
#$ -o log
#$ -e log
#$ -j y
#$ -l s_vmem=16G
#$ -pe def_slot 8
set -eux

SAMPLE=$1
INPUT_BAM=$2
CHR=$3
SAMTOOLS_PATH=/usr/local/bin/samtools

source ./conf/param.sh

OUTPUT_DIR=$PWD/split/GenomonFisher/${SAMPLE}

${CONF_SINGLARITY_PATH} exec ${CONF_GenomonFisher_SINGULARITY_OPTION} \
    ${CONF_GenomonFisher_IMG} \
    /bin/bash ${CONF_SCRIPT_PATH}/GenomonFisher.sh \
    ${INPUT_BAM} \
    ${OUTPUT_DIR} \
    ${CONF_GenomonFisher_REFERENCE} \
    ${CHR} \
    ${SAMTOOLS_PATH}