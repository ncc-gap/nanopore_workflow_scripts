#!/bin/bash -x
set -eux -o pipefail

INPUT_FASTQ=$1
INPUT_BAM=$2
OUTPUT_FILE=$3
REGION=$4
REFERENCE=$5

OUTPUT_DIR=$(dirname ${OUTPUT_FILE})

mkdir -p ${OUTPUT_DIR}

/tools/nanopolish/nanopolish call-methylation \
-t 6 \
-r ${INPUT_FASTQ} \
-b ${INPUT_BAM} \
-w "${REGION}" \
-g ${REFERENCE} \
> ${OUTPUT_FILE}.tmp

mv ${OUTPUT_FILE}.tmp ${OUTPUT_FILE}
