#!/bin/bash
#
# Set SGE
#
#$ -S /bin/bash         # set shell in UGE
#$ -cwd                 # execute at the submitted dir
#$ -e ./log/
#$ -o ./log/
#$ -j y
#$ -l s_vmem=16G
#$ -pe def_slot 8

set -eux

INPUT_BAM=$1
OUTPUT_DIR=$2
CHR=$3

REFERENCE=/home/aokada/nanopore/database/broad/hg38/v0/Homo_sapiens_assembly38.fasta

OUTPUT_DIR=${OUTPUT_DIR}/${CHR}

PMDV_DIR=/home/aiokada/sandbox/nanopore_workflow_dev
OUTPUT_DIR=${PMDV_DIR}/output/COLO829BL

mkdir -p ${OUTPUT_DIR}

singularity exec ${PMDV_DIR}/image/pepper_deepvariant_r0.8.sif \
  run_pepper_margin_deepvariant call_variant \
    -b /home/aiokada/resources/sample/COLO829BL/COLO829BL_chr22.bam \
    -f /home/aiokada/resources/database/hg38/v0/Homo_sapiens_assembly38.fasta \
    -o ${OUTPUT_DIR} \
    -p COLO829BL_chr22 \
    -t 8 \
    --ont_r9_guppy5_sup
