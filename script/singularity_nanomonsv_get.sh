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
TUMOR_INPUT=$2
CONTROL_INPUT=$3

source ./conf/param.sh

CONTROL=$(basename $(dirname ${CONTROL_INPUT}))

TUMOR_BAM=$PWD/whatshap/${SAMPLE}/${SAMPLE}.bam
TUMOR_PREFIX=$PWD/nanomonsv/${SAMPLE}/${SAMPLE}
CONTROL_BAM=$PWD/whatshap/${CONTROL}/${CONTROL}.bam
CONTROL_PREFIX=$PWD/nanomonsv/${CONTROL}/${CONTROL}

${CONF_SINGLARITY_PATH} exec ${CONF_NANOMONSV_GET_SINGULARITY_OPTION} \
    ${CONF_NANOMONSV_GET_IMG} \
    /bin/bash $PWD/script/nanomonsv_get.sh \
    ${TUMOR_BAM} \
    ${TUMOR_PREFIX} \
    ${CONTROL_BAM} \
    ${CONTROL_PREFIX} \
    ${CONF_NANOMONSV_GET_REFERENCE} \
    ${CONF_NANOMONSV_GET_CONTROLPANEL_PREFIX}
