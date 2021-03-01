#!/bin/bash -x
#$ -S /bin/bash
#$ -cwd
#$ -o /home/aiokada/nanopore/log/SAMN13152502
#$ -e /home/aiokada/nanopore/log/SAMN13152502
#$ -l s_vmem=16G

CHR=$1
SAMPLE=SAMN13152502

IMAGE=/home/aokada/nanopore/image/minimap2-2.17.simg
SCRIPT_DIR=/home/aokada/nanopore/tools/nanopore_workflow_scripts/scripts
OUTPUT_ROOT=/home/aokada/nanopore/output

singularity exec  \
${IMAGE} \
/bin/bash ${SCRIPT_DIR}/common/whatshap_phase.sh \
${OUTPUT_ROOT}/medaka/${SAMPLE}/${CHR}/round_1.vcf.gz \
${OUTPUT_ROOT}/minimap2/${SAMPLE}/${SAMPLE}.bam \
${OUTPUT_ROOT}/whatshap/${SAMPLE}/${CHR}

