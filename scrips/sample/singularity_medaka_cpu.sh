#!/bin/bash -x
#$ -S /bin/bash
#$ -cwd
#$ -o /home/aiokada/nanopore/log/COLO829
#$ -e /home/aiokada/nanopore/log/COLO829
#$ -l s_vmem=16G,mem_req=16G
#$ -pe def_slot 2
#$ -q '!mjobs_rerun.q'

CHR=$1
SAMPLE=COLO829

IMAGE=/home/aiokada/nanopore/image/medaka-20201224-cpu.simg
SCRIPT_DIR=/home/aiokada/nanopore/script
OUTPUT_ROOT=/home/aiokada/output

singularity exec  \
${IMAGE} \
/bin/bash ${SCRIPT_DIR}/common/medaka_cpu_split.sh \
${OUTPUT_ROOT}/minimap2/${SAMPLE}/${SAMPLE}.bam \
${OUTPUT_ROOT}/medaka/${SAMPLE} \
${CHR}
