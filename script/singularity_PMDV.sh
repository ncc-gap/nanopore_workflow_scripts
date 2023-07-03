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
CHR=$2
DATA=$3

source ./conf/param.sh

INPUT_BAM=$PWD/minimap2/${SAMPLE}/${SAMPLE}.bam
OUTPUT_DIR=$PWD/split/PMDV/${SAMPLE}/${CHR}

${CONF_SINGLARITY_PATH} exec ${CONF_PMDV_SINGULARITY_OPTION} \
    ${CONF_PMDV_IMG} \
    /bin/bash ${CONF_SCRIPT_PATH}/PMDV.sh \
    ${INPUT_BAM} \
    ${OUTPUT_DIR} \
    ${CHR} \
    ${CONF_PMDV_REFERENCE} \
    ${DATA}
