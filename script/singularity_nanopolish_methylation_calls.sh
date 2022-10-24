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

INPUT_BAM=$PWD/whatshap/${SAMPLE}/${SAMPLE}.bam

OUTPUT_DIR=$PWD/split/nanopolish/${SAMPLE}/${CHR}
OUTPUT_FILE=${OUTPUT_DIR}/methylation_calls.tsv
LOCAL_FASTQ=${OUTPUT_DIR}/$(basename $(ls ${INPUT_FASTQ}))

rm -rf ${OUTPUT_DIR}
mkdir -p ${OUTPUT_DIR}
ln -s ${INPUT_FASTQ} ${LOCAL_FASTQ}
cp $PWD/nanopolish/${SAMPLE}/$(basename $(ls ${INPUT_FASTQ})).index* ${OUTPUT_DIR}/

${CONF_SINGLARITY_PATH} exec ${CONF_NANOPOLISH_SINGULARITY_OPTION} \
    ${CONF_NANOPOLISH_IMG} \
    /bin/bash $PWD/script/nanopolish_methylation_calls.sh \
    ${LOCAL_FASTQ} \
    ${INPUT_BAM} \
    ${OUTPUT_FILE} \
    ${CHR} \
    ${CONF_NANOPOLISH_REFERENCE}
