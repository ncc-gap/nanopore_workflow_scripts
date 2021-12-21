#!/bin/bash -x
#$ -S /bin/bash
#$ -cwd
#$ -o /home/aokada/nanopore/log/ALX_201229
#$ -e /home/aokada/nanopore/log/ALX_201229
#$ -l s_vmem=4G
#$ -pe def_slot 6

CHR=$1
SAMPLE=ALX_201229

IMAGE=/home/aokada/nanopore/image/nanopolish-latest.simg
SCRIPT_DIR=/home/aokada/nanopore/tools/nanopore_workflow_scripts/scripts
OUTPUT_ROOT=/home/aokada/nanopore/output

INPUT_FAST5=/home/aokada/nanopore/fast5/ALX_201229/
INPUT_FASTQ=/home/aokada/nanopore/fastq/ALX_201229/ALX_201229.fastq.gz

singularity exec --bind /home/yuishira/genebay/ \
${IMAGE} \
/bin/bash ${SCRIPT_DIR}/common/nanopolish_split.sh \
${INPUT_FAST5} \
${INPUT_FASTQ} \
${OUTPUT_ROOT}/nanopolish_F2304/${SAMPLE}/F2304.bam \
${OUTPUT_ROOT}/nanopolish_F2304/${SAMPLE}/${CHR} \
${CHR}

