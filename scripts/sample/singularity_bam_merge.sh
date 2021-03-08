#!/bin/bash -x
#$ -S /bin/bash
#$ -cwd
#$ -o /home/aokada/nanopore/log/shTET3_merge_293FT_15
#$ -e /home/aokada/nanopore/log/shTET3_merge_293FT_15
#$ -l s_vmem=8G

SAMPLE=shTET3_merge_293FT_15

IMAGE=/home/aokada/nanopore/image/medaka-20201224-cpu.simg
SCRIPT_DIR=/home/aokada/nanopore/tools/nanopore_workflow_scripts/scripts
OUTPUT_ROOT=/home/aokada/nanopore/output
INPUT_BAMS="${OUTPUT_ROOT}/minimap2/shTET3NOC18_10w_293FT_15/shTET3NOC18_10w_293FT_15.bam ${OUTPUT_ROOT}/minimap2/shTET3NOC18_20w_293FT_15/shTET3NOC18_20w_293FT_15.bam ${OUTPUT_ROOT}/minimap2/shTET3NOC18_4w_293FT_15/shTET3NOC18_4w_293FT_15.bam ${OUTPUT_ROOT}/minimap2/shTET3_init_293FT_15/shTET3_init_293FT_15.bam"

mkdir -p ${OUTPUT_ROOT}/minimap2/${SAMPLE}
singularity exec  \
${IMAGE} \
samtools merge ${OUTPUT_ROOT}/minimap2/${SAMPLE}/${SAMPLE}.bam ${INPUT_BAMS} -@ 8

singularity exec  \
${IMAGE} \
samtools index ${OUTPUT_ROOT}/minimap2/${SAMPLE}/${SAMPLE}.bam
