#!/bin/bash -x
#$ -S /bin/bash
#$ -cwd
#$ -o /home/aiokada/nanopore/log/COLO829
#$ -e /home/aiokada/nanopore/log/COLO829
#$ -l s_vmem=32G,mem_req=32G

SAMPLE=COLO829

IMAGE=/home/aiokada/nanopore/image/minimap2-2.17.simg
SCRIPT_DIR=/home/aiokada/nanopore/script
OUTPUT_ROOT=/home/aiokada/output
INPUT_FASTQ=/home/aiokada/guppy3.4.5/COLO829/COLO829_pass.fastq.gz

singularity exec  \
${IMAGE} \
/bin/bash ${SCRIPT_DIR}/common/minimap2.sh \
${INPUT_FASTQ} \
${OUTPUT_ROOT}/minimap2/${SAMPLE}/ \
${SAMPLE}

