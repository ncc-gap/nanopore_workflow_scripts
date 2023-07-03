#!/bin/bash -x
#$ -S /bin/bash
#$ -cwd
#$ -o log
#$ -e log
#$ -j y
#$ -l s_vmem=8G
set -eux

SAMPLE=$1
TUMOR_BAM=$2
CONTROL_PHASED_VCF=$3

source ./conf/param.sh

OUTPUT_BAM=$PWD/whatshap/${SAMPLE}/${SAMPLE}.bam
OUTPUT_FILE=$PWD/whatshap/${SAMPLE}/haplotag.txt

${CONF_SINGLARITY_PATH} exec ${CONF_WHATSHAP_HAPLOTAG_SINGULARITY_OPTION} \
    ${CONF_WHATSHAP_HAPLOTAG_IMG} \
    /bin/bash ${CONF_SCRIPT_PATH}/whatshap_haplotag.sh \
    ${CONTROL_PHASED_VCF} \
    ${TUMOR_BAM} \
    ${OUTPUT_BAM} \
    ${OUTPUT_FILE} \
    ${CONF_WHATSHAP_HAPLOTAG_REFERENCE}

