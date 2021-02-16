#!/bin/bash -x
#$ -S /bin/bash
#$ -cwd
#$ -o /home/aiokada/nanopore/log/COLO829
#$ -e /home/aiokada/nanopore/log/COLO829
#$ -l s_vmem=16G,mem_req=16G

SAMPLE_TUMOR=COLO829
SAMPLE_NORMAL=COLO829BL

IMAGE=/home/aiokada/nanopore/image/minimap2-2.17.simg
SCRIPT_DIR=/home/aiokada/nanopore/script
OUTPUT_ROOT=/home/aiokada/output

singularity exec  \
${IMAGE} \
/bin/bash ${SCRIPT_DIR}/common/whatshap_haplotag.sh \
${OUTPUT_ROOT}/whatshap/${SAMPLE_NORMAL}/phased.vcf.gz \
${OUTPUT_ROOT}/minimap2/${SAMPLE_TUMOR}/${SAMPLE_TUMOR}.bam \
${OUTPUT_ROOT}/whatshap/${SAMPLE_TUMOR}

