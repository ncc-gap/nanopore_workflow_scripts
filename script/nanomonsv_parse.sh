#!/bin/bash -x
set -eux -o pipefail

OUTPUT_BAM=$1
OUTPUT_PREFIX=$2

mkdir -p $(dirname ${OUTPUT_PREFIX})
nanomonsv parse \
    ${OUTPUT_BAM} \
    ${OUTPUT_PREFIX}
