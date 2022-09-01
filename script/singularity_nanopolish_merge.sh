#!/bin/bash -x
#$ -S /bin/bash
#$ -cwd
#$ -o log
#$ -e log
#$ -j y
#$ -l s_vmem=8G
set -eux

SAMPLE=$1

source ./conf/param.sh

INPUT_DIR=$PWD/split/nanopolish/${SAMPLE}
OUTPUT_TSV=$PWD/nanopolish/${SAMPLE}/methylation_calls.tsv

${CONF_SINGLARITY_PATH} exec ${CONF_NANOPOLISH_MERGE_SINGULARITY_OPTION} \
    ${CONF_NANOPOLISH_MERGE_IMG} \
    /bin/bash $PWD/script/nanopolish_merge.sh \
    ${INPUT_DIR} \
    methylation_calls.tsv \
    ${OUTPUT_TSV}
