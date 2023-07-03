#!/bin/bash -x
set -eux -o pipefail

INPUT_BAM=$1
MERGE_TAG_INPUT_BAM=$2
OUTPUT_DIR=$3
REF=$4

export_tag -i ${INPUT_BAM} -o ${OUTPUT_DIR}/

merge_tag -i ${MERGE_TAG_INPUT_BAM} -t ${OUTUT_DIR}/${INPUT_BAM%.bam}_export_taginfo.txt -o ${OUTPUT_DIR}/${MERGE_TAG_INPUT_BAM%.bam}_merge_tags_sorted.bam --threads 16

split_bam -i ${OUTPUT_DIR}/${INPUT_BAM%.bam}_merge_tags_sorted.bam -o ${OUTPUT_DIR}/

for hp_tag in 1 2 _none
do
    bash /ModbamETLTools/scripts/etl_tools/exec_bam_to_bed.sh ${OUTPUT_DIR}/${INPUT_BAM%.bam}_merge_HP${hp_tag}.bam ${REF} 16
done
