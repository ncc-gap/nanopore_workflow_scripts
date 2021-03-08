#!/bin/bash -x
#$ -S /bin/bash
#$ -cwd
#$ -o /home/aokada/nanopore/log/ALX_201229
#$ -e /home/aokada/nanopore/log/ALX_201229
#$ -l s_vmem=3G
#$ -pe def_slot 4

CHR=$1
SAMPLE=ALX_201229

IMAGE=/home/aokada/nanopore/image/ensembl-vep-20210201.simg
SCRIPT_DIR=/home/aokada/nanopore/tools/nanopore_workflow_scripts/scripts
OUTPUT_ROOT=/home/aokada/nanopore/output

singularity exec \
${IMAGE} \
/bin/bash ${SCRIPT_DIR}/common/vep_annot.sh \
${OUTPUT_ROOT}/medaka/${SAMPLE}/${CHR}/round_1.vcf.gz \
${OUTPUT_ROOT}/vep/${SAMPLE}/${CHR}/round_1.vcf
