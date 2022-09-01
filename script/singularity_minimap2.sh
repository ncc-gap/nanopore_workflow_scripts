#!/bin/bash -x
#$ -S /bin/bash
#$ -cwd
#$ -o log
#$ -e log
#$ -j y
#$ -l s_vmem=4G
#$ -pe def_slot 8
set -eux

SAMPLE=$1
INPUT_FASTQ=$2

source ./conf/param.sh

OUTPUT_BAM=$PWD/minimap2/${SAMPLE}/${SAMPLE}.bam

${CONF_SINGLARITY_PATH} exec ${CONF_MINIMAP2_SINGULARITY_OPTION} \
    ${CONF_MINIMAP2_IMG} \
    /bin/bash $PWD/script/minimap2.sh \
    ${INPUT_FASTQ} \
    ${OUTPUT_BAM} \
    ${CONF_MINIMAP2_REFERENCE}
