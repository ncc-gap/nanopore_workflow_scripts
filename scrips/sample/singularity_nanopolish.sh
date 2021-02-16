#!/bin/bash -x
#$ -S /bin/bash
#$ -cwd
#$ -o /home/aiokada/nanopore/log/COLO829
#$ -e /home/aiokada/nanopore/log/COLO829
#$ -l s_vmem=2G,mem_req=2G
#$ -pe def_slot 6
#$ -l ljob

CHR=$1
SAMPLE=COLO829

IMAGE=/home/kchiba/work_directory/work_nanopore/image/nanopolish-latest.simg
SCRIPT_DIR=/home/aiokada/nanopore/script
OUTPUT_ROOT=/home/aiokada/output

INPUT_FAST5=/home/aiokada/guppy3.4.5/COLO829/
INPUT_FASTQ=/home/aiokada/guppy3.4.5/COLO829/COLO829_pass.fastq.gz

singularity exec \
${IMAGE} \
/bin/bash ${SCRIPT_DIR}/common/nanopolish_split.sh \
${INPUT_FAST5} \
${INPUT_FASTQ} \
${OUTPUT_ROOT}/minimap2/${SAMPLE}/${SAMPLE}.bam \
${OUTPUT_ROOT}/nanopolish/${SAMPLE}/${CHR} \
${CHR}
