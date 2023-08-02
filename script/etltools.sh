#!/bin/bash -x
set -eux -o pipefail

INPUT_BAM=$1
MERGE_TAG_INPUT_BAM=$2
OUTPUT_DIR=$3
REF=$4
SAMPLE=$5

export_tag -i ${INPUT_BAM} -o ${OUTPUT_DIR} --no_fastq

merge_tag -i ${MERGE_TAG_INPUT_BAM} -t ${OUTPUT_DIR}/*_export_taginfo.txt -o ${OUTPUT_DIR} --threads 16

split_bam -i ${OUTPUT_DIR}/${SAMPLE}_merge_tags_sorted.bam -o ${OUTPUT_DIR}

for hp_tag in 1 2 _none
do
    /tools/modbam2bed/modbam2bed \
        -m 5mC \
        -e \
        -t 8 \
        ${REF} \
        ${OUTPUT_DIR}/${SAMPLE}_merge_tags_sorted_HP${hp_tag}.bam > ${OUTPUT_DIR}/${SAMPLE}_HP${hp_tag}.bed
    gzip ${OUTPUT_DIR}/${SAMPLE}_HP${hp_tag}.bed
done

rm ${OUTPUT_DIR}/${SAMPLE}_merge_tags.bam
rm ${OUTPUT_DIR}/${SAMPLE}_merge_tags_sorted_HP*.bam
#rm ${OUTPUT_DIR}/${SAMPLE}_merge_tags_sorted.bam