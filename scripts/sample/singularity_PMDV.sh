#!/bin/bash -x
#$ -S /bin/bash
#$ -cwd
#$ -o /home/aokada/nanopore/log/COLO829BL
#$ -e /home/aokada/nanopore/log/COLO829BL
#$ -l s_vmem=16G
#$ -pe def_slot 8

set -eux

CHR=$1
SAMPLE=COLO829BL

IMAGE=/home/aokada/nanopore/image/pepper_deepvariant_r0.8.sif
SCRIPT_DIR=/home/aokada/nanopore/tools/nanopore_workflow_scripts/scripts
OUTPUT_ROOT=/home/aokada/nanopore/output

singularity exec  \
${IMAGE} \
/bin/bash ${SCRIPT_DIR}/common/PMDV_split.sh \
${OUTPUT_ROOT}/minimap2/${SAMPLE}/${SAMPLE}.bam \
${OUTPUT_ROOT}/PMDV/${SAMPLE} \
${SAMPLE} \
${CHR}
