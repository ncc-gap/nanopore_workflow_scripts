#!/bin/bash -x
#$ -S /bin/bash
#$ -cwd
#$ -o /home/aokada/nanopore/log/ALX_201229
#$ -e /home/aokada/nanopore/log/ALX_201229
#$ -l s_vmem=8G

SAMPLE=ALX_201229

IMAGE=/home/aokada/nanopore/image/medaka-20201224-cpu.simg
SCRIPT_DIR=/home/aokada/nanopore/tools/nanopore_workflow_scripts/scripts
OUTPUT_ROOT=/home/aokada/nanopore/output

singularity exec \
${IMAGE} \
/bin/bash ${SCRIPT_DIR}/common/nanopolish_merge.sh \
${OUTPUT_ROOT}/nanopolish_F2304/${SAMPLE} 
