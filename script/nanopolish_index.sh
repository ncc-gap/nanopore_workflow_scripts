#!/bin/bash -x
set -eux -o pipefail

INPUT_FAST5=$1
INPUT_FASTQ=$2
OUTPUT_DIR=$3

mkdir -p ${OUTPUT_DIR}
LOCAL_FASTQ=${OUTPUT_DIR}/$(basename ${INPUT_FASTQ})
rm -f ${LOCAL_FASTQ}
ln -s ${INPUT_FASTQ} ${LOCAL_FASTQ}

/tools/nanopolish/nanopolish index -d ${INPUT_FAST5} ${LOCAL_FASTQ}
touch ${OUTPUT_DIR}/index
