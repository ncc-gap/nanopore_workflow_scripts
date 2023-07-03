#!/bin/bash -x
#$ -S /bin/bash
#$ -cwd
#$ -o log
#$ -e log
#$ -j y
#$ -l s_vmem=8G
set -eux

SAMPLE=$1
CHR=$2

source ./conf/param.sh

INPUT_BAM=$PWD/minimap2/${SAMPLE}/${SAMPLE}.bam
INPUT_VCF=$PWD/split/vep/${SAMPLE}/${CHR}/PMDV.annot.filt.vcf.gz
OUTPUT_VCF=$PWD/split/whatshap/${SAMPLE}/${CHR}/phased.vcf

${CONF_SINGLARITY_PATH} exec ${CONF_WHATSHAP_PHASE_SINGULARITY_OPTION} \
    ${CONF_WHATSHAP_PHASE_IMG} \
    /bin/bash ${CONF_SCRIPT_PATH}/whatshap_phase.sh \
    ${INPUT_VCF} \
    ${INPUT_BAM} \
    ${OUTPUT_VCF} \
    ${CONF_WHATSHAP_PHASE_REFERENCE}

