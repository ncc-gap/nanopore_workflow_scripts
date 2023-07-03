#!/bin/bash -x
set -eux -o pipefail

INPUT_BAM=$1
OUTPUT_DIR=$2

export_tag -i ${INPUT_BAM} -o ${OUTPUT_DIR}/
