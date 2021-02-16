#!/bin/bash -x
#$ -S /bin/bash
#$ -cwd
#$ -o /home/aiokada/nanopore/log/COLO829BL
#$ -e /home/aiokada/nanopore/log/COLO829BL
#$ -l s_vmem=16G,mem_req=16G

CHR=$1
SAMPLE=COLO829BL

IMAGE=/home/aiokada/nanopore/image/minimap2-2.17.simg
SCRIPT_DIR=/home/aiokada/nanopore/script
OUTPUT_ROOT=/home/aiokada/output

singularity exec  \
${IMAGE} \
/bin/bash ${SCRIPT_DIR}/common/whatshap_phase.sh \
${OUTPUT_ROOT}/medaka/${SAMPLE}/${CHR}/round_1.vcf.gz \
${OUTPUT_ROOT}/minimap2/${SAMPLE}/${SAMPLE}.bam \
${OUTPUT_ROOT}/whatshap/${SAMPLE}/${CHR}

