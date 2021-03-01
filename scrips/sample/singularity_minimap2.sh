#!/bin/bash -x
#$ -S /bin/bash
#$ -cwd
#$ -o /home/aokada/nanopore/log/SAMN13152502
#$ -e /home/aokada/nanopore/log/SAMN13152502
#$ -l s_vmem=32G

SAMPLE=SAMN13152502

IMAGE=/home/aokada/nanopore/image/minimap2-2.17.simg
SCRIPT_DIR=/home/aokada/nanopore/tools/nanopore_workflow_scripts/scripts
OUTPUT_ROOT=/home/aokada/nanopore/output
INPUT_FASTQ=/home/aokada/nanopore/fastq/SAMN13152502/SRR10359531.sra.fastq.gz

singularity exec  \
${IMAGE} \
/bin/bash ${SCRIPT_DIR}/common/minimap2.sh \
${INPUT_FASTQ} \
${OUTPUT_ROOT}/minimap2/${SAMPLE}/ \
${SAMPLE}

