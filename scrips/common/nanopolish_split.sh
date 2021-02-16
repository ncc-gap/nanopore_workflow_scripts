#!/bin/bash -x
set -x
set -o errexit
set -o nounset

INPUT_FAST5=$1
INPUT_FASTQ=$2
INPUT_BAM=$3
OUTPUT_DIR=$4
REGION=$5

REFERENCE=/home/aiokada/GRCh38.d1.vd1/GRCh38.d1.vd1.fa

mkdir -p ${OUTPUT_DIR}
LOCAL_FASTQ=${OUTPUT_DIR}/$(basename ${INPUT_FASTQ})
rm -f ${LOCAL_FASTQ}
ln -s ${INPUT_FASTQ} ${LOCAL_FASTQ}
/nanopolish/nanopolish index -d ${INPUT_FAST5} ${LOCAL_FASTQ}

/nanopolish/nanopolish call-methylation \
-t 6 \
-r ${LOCAL_FASTQ} \
-b ${INPUT_BAM} \
-w "${REGION}" \
-g ${REFERENCE} \
> ${OUTPUT_DIR}/methylation_calls.tsv
