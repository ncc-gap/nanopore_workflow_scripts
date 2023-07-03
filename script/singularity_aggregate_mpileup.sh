#!/bin/bash -x
#$ -S /bin/bash
#$ -cwd
#$ -o log
#$ -e log
#$ -j y
#$ -l s_vmem=16G
#$ -pe def_slot 8
set -eux

SAMPLE=$1
CHR=$2

source ./conf/param.sh

INPUT_BAM=$PWD/minimap2/${SAMPLE}/${SAMPLE}.bam
INPUT_VCF=$PWD/split/GenomonFisher/${SAMPLE}/${CHR}.vcf.gz
OUTPUT_DIR=$PWD/split/GenomonFisher/pileup/${SAMPLE}


${CONF_SINGLARITY_PATH} exec ${CONF_aggreaget_mpileup_SINGULARITY_OPTION} \
    ${CONF_aggregate_mpileup_IMG} \
    /bin/bash ${CONF_SCRIPT_PATH}/aggregate_mpileup.sh \
    ${INPUT_VCF} \
    ${INPUT_BAM} \
    ${CHR} \
    ${CONF_aggreaget_mpileup_BLACK_LIST}/HPRC_PacBio_HiFi_DeepConsensus_103.blacklist.${CHR}.txt.gz \
    ${CONF_aggreaget_mpileup_BLACK_LIST_HEADER} \
    ${CONF_aggreaget_mpileup_REFERENCE} \
    ${OUTPUT_DIR} \
    ${CONF_aggreaget_mpileup_ANNOTATION_HEADER} \
    ${CONF_aggreaget_mpileup_GNOMAD}



