#!/bin/bash -x
set -eux -o pipefail

INPUT_FAST5=$1
INPUT_FASTQ=$2
INPUT_BAM=$3
OUTPUT_FILE=$4
REGION=$5
REFERENCE=$6

OUTPUT_DIR=$(dirname ${OUTPUT_FILE})

mkdir -p ${OUTPUT_DIR}
LOCAL_FASTQ=${OUTPUT_DIR}/$(basename ${INPUT_FASTQ})
rm -f ${LOCAL_FASTQ}
ln -s ${INPUT_FASTQ} ${LOCAL_FASTQ}

/tools/nanopolish/nanopolish index -d ${INPUT_FAST5} ${LOCAL_FASTQ}

/tools/nanopolish/nanopolish call-methylation \
-t 6 \
-r ${LOCAL_FASTQ} \
-b ${INPUT_BAM} \
-w "${REGION}" \
-g ${REFERENCE} \
> ${OUTPUT_FILE}
