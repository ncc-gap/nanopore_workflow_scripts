#!/bin/bash -x
set -eux -o pipefail

input_vcf=$1
input_bam=$2
CHR=$3
blacklist_file=$4
blacklist_header=$5
REF=$6
OUTPUT_DIR=$7
annotation_header=$8
gnomad=$9

bcftools annotate \
    -a ${blacklist_file} \
    -h ${blacklist_header} \
    -c CHROM,POS,-,NBL,- \
    ${input_vcf} \
    > ${input_vcf%.vcf.gz}.annot.vcf

bcftools filter \
    -e "INFO/NBL>0" \
    ${input_vcf%.vcf.gz}.annot.vcf \
    > ${input_vcf%.vcf.gz}.annot.filt.vcf

bgzip -f ${input_vcf%.vcf.gz}.annot.filt.vcf
tabix -f -p vcf ${input_vcf%.vcf.gz}.annot.filt.vcf.gz

samtools mpileup \
    -f ${REF} \
    -o ${OUTPUT_DIR}/${CHR}_control.pileup \
    -q 30 \
    -Q 15 \
    -B \
    -d 10000000 \
    -r ${CHR} \
    ${input_bam}

input_file=${OUTPUT_DIR}/${CHR}_control.pileup 
output_file=${OUTPUT_DIR}/${CHR}_control.pileup.parse 
/tools/aggregate_mpileup/target/release/aggregate_mpileup \
    parse \
    -i ${input_file} \
    -o ${output_file} \
    --mode single

bgzip -f -c ${output_file} > ${output_file}.gz
tabix -f -s1 -b2 -e2 ${output_file}.gz

bcftools annotate \
    -a ${output_file}.gz \
    -h ${annotation_header} \
    -c CHROM,POS,-,NDP,-,NNM,-,-,- \
    ${input_vcf%.vcf.gz}.annot.filt.vcf.gz \
    > ${input_vcf%.vcf.gz}.annot_matched_normal.vcf

bcftools filter \
    -e "INFO/NNM>0" \
    ${input_vcf%.vcf.gz}.annot_matched_normal.vcf \
    > ${input_vcf%.vcf.gz}.annot_matched_normal.filt.vcf

bgzip -f ${input_vcf%.vcf.gz}.annot_matched_normal.filt.vcf
tabix -f -p vcf ${input_vcf%.vcf.gz}.annot_matched_normal.filt.vcf.gz

bcftools annotate \
    -a ${gnomad} \
    -c "INFO/gnomAD_AF:=INFO/AF" \
    ${input_vcf%.vcf.gz}.annot_matched_normal.filt.vcf.gz \
    > ${input_vcf%.vcf.gz}.gnomad.vcf

bcftools filter \
    -e "INFO/gnomAD_AF>0.001" \
    ${input_vcf%.vcf.gz}.gnomad.vcf \
    > ${input_vcf%.vcf.gz}.gnomad.filt.vcf

bgzip -f ${input_vcf%.vcf.gz}.gnomad.filt.vcf
tabix -f -p vcf ${input_vcf%.vcf.gz}.gnomad.filt.vcf.gz