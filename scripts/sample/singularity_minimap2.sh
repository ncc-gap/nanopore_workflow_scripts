#!/bin/bash -x
#$ -S /bin/bash
#$ -cwd
#$ -o /home/aokada/nanopore/log/ALX_201229
#$ -e /home/aokada/nanopore/log/ALX_201229
#$ -l s_vmem=32G

SAMPLE=ALX_201229

IMAGE=/home/aokada/nanopore/image/minimap2-2.17.simg
SCRIPT_DIR=/home/aokada/nanopore/tools/nanopore_workflow_scripts/scripts
OUTPUT_ROOT=/home/aokada/nanopore/output
INPUT_FASTQ=/home/aokada/nanopore/fastq/ALX_201229/ALX_201229.fastq.gz

singularity exec  \
${IMAGE} \
/bin/bash ${SCRIPT_DIR}/common/minimap2.sh \
${INPUT_FASTQ} \
${OUTPUT_ROOT}/minimap2/${SAMPLE}/ \
${SAMPLE}

