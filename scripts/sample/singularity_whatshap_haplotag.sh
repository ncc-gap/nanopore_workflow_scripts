#!/bin/bash -x
#$ -S /bin/bash
#$ -cwd
#$ -o /home/aokada/nanopore/log/ALX_201229
#$ -e /home/aokada/nanopore/log/ALX_201229
#$ -l s_vmem=16G

SAMPLE_TUMOR=ALX_201229
SAMPLE_NORMAL=ALX_201229

IMAGE=/home/aokada/nanopore/image/minimap2-2.17.simg
SCRIPT_DIR=/home/aokada/nanopore/tools/nanopore_workflow_scripts/scripts
OUTPUT_ROOT=/home/aokada/nanopore/output

singularity exec  \
${IMAGE} \
/bin/bash ${SCRIPT_DIR}/common/whatshap_haplotag.sh \
${OUTPUT_ROOT}/whatshap/${SAMPLE_NORMAL}/phased.vcf.gz \
${OUTPUT_ROOT}/minimap2/${SAMPLE_TUMOR}/${SAMPLE_TUMOR}.bam \
${OUTPUT_ROOT}/whatshap/${SAMPLE_TUMOR}

