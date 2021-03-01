#!/bin/bash -x
#$ -S /bin/bash
#$ -cwd
#$ -o /home/aokada/nanopore/log/SAMN13152502
#$ -e /home/aokada/nanopore/log/SAMN13152502
#$ -l s_vmem=2G
#$ -pe def_slot 6

CHR=$1
SAMPLE=SAMN13152502

IMAGE=/home/aokada/nanopore/image/nanopolish-latest.simg
SCRIPT_DIR=/home/aokada/nanopore/tools/nanopore_workflow_scripts/scripts
OUTPUT_ROOT=/home/aokada/nanopore/output

INPUT_FAST5=/home/aokada/nanopore/fast5/SAMN13152502/
INPUT_FASTQ=/home/aokada/nanopore/fastq/SAMN13152502/SRR10359531.sra.fastq.gz

singularity exec --bind /home/yuishira/genebay/ \
${IMAGE} \
/bin/bash ${SCRIPT_DIR}/common/nanopolish_split.sh \
${INPUT_FAST5} \
${INPUT_FASTQ} \
${OUTPUT_ROOT}/minimap2/${SAMPLE}/${SAMPLE}.bam \
${OUTPUT_ROOT}/nanopolish/${SAMPLE}/${CHR} \
${CHR}
