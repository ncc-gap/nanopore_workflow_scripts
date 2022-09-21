#!/bin/bash -x
#$ -S /bin/bash
#$ -cwd
#$ -o log
#$ -e log
#$ -j y
#$ -l s_vmem=12G
#$ -pe def_slot 2
set -eux

SAMPLE=$1
FASTQ=$2
FAST5_DIR=$3

source ./conf/param.sh

OUTPUT_DIR=$PWD/nanopolish/${SAMPLE}

${CONF_SINGLARITY_PATH} exec ${CONF_NANOPOLISH_SINGULARITY_OPTION} \
    ${CONF_NANOPOLISH_IMG} \
    /bin/bash $PWD/script/nanopolish_index.sh \
    ${FAST5_DIR} \
    ${FASTQ} \
    ${OUTPUT_DIR}
