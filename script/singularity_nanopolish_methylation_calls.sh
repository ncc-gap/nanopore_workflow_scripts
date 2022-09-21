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
INPUT_FASTQ=$3

source ./conf/param.sh

LOCAL_FASTQ=$PWD/nanopolish/${SAMPLE}/$(basename $(ls ${INPUT_FASTQ}))
INPUT_BAM=$PWD/whatshap/${SAMPLE}/${SAMPLE}.bam
OUTPUT_FILE=$PWD/split/nanopolish/${SAMPLE}/${CHR}/methylation_calls.tsv

${CONF_SINGLARITY_PATH} exec ${CONF_NANOPOLISH_SINGULARITY_OPTION} \
    ${CONF_NANOPOLISH_IMG} \
    /bin/bash $PWD/script/nanopolish.sh \
    ${LOCAL_FASTQ} \
    ${INPUT_BAM} \
    ${OUTPUT_FILE} \
    ${CHR} \
    ${CONF_NANOPOLISH_REFERENCE}
