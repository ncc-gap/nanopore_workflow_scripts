#!/bin/bash -x
#$ -S /bin/bash
#$ -cwd
#$ -o log
#$ -e log
#$ -j y
#$ -l s_vmem=4G
#$ -pe def_slot 6
set -eux

SAMPLE=$1
CHR=$2
FASTQ=$3
FAST5_DIR=$4

source ./conf/param.sh

INPUT_BAM=$PWD/minimap2/${SAMPLE}/${SAMPLE}.bam
OUTPUT_FILE=$PWD/split/nanopolish/${SAMPLE}/${CHR}/methylation_calls.tsv

${CONF_SINGLARITY_PATH} exec ${CONF_NANOPOLISH_SINGULARITY_OPTION} \
    ${CONF_NANOPOLISH_IMG} \
    /bin/bash $PWD/script/nanopolish.sh \
    ${FAST5_DIR} \
    ${FASTQ} \
    ${INPUT_BAM} \
    ${OUTPUT_FILE} \
    ${CHR} \
    ${CONF_NANOPOLISH_REFERENCE}
