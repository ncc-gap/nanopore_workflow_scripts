#!/bin/bash -x
set -eux -o pipefail

TUMOR_BAM=$1
TUMOR_PREFIX=$2
CONTROL_BAM=$3
CONTROL_PREFIX=$4
REFERENCE=$5
CONTROL_PANEL_PREFIX=$6

NANOMONSV_PARAM=""
if [ ${TUMOR_BAM} != ${CONTROL_BAM} ]
then
    NANOMONSV_PARAM="--control_prefix ${CONTROL_PREFIX} --control_bam ${CONTROL_BAM}"
fi

nanomonsv get \
    ${TUMOR_PREFIX} \
    ${TUMOR_BAM} \
    ${REFERENCE} \
    --processes 8 \
    --single_bnd \
    --use_racon \
    --control_panel_prefix ${CONTROL_PANEL_PREFIX} ${NANOMONSV_PARAM}
