#!/bin/bash -x
#$ -S /bin/bash
#$ -cwd
#$ -o log
#$ -e log
#$ -j y
#$ -l s_vmem=2G
set -eux

SAMPLE=$1
CHR=$2

source ./conf/param.sh

INPUT_VCF=$PWD/split/vep/${SAMPLE}/${CHR}/PMDV.annot.vcf.gz
OUTPUT_VCF=$PWD/split/vep/${SAMPLE}/${CHR}/PMDV.annot.filt.vcf

${CONF_SINGLARITY_PATH} exec ${CONF_VEP_FILT_SINGULARITY_OPTION} \
    ${CONF_VEP_FILT_IMG} \
    /bin/bash $PWD/script/vep_filt.sh \
    ${INPUT_VCF} \
    ${OUTPUT_VCF} \
