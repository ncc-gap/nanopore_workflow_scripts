#$ -o log
#$ -e log
#$ -j y
#$ -l s_vmem=16G
#$ -pe def_slot 8
set -eux

source ./conf/param.sh

SAMPLE=$1
OUTPUT_DIR=$PWD/methylation/${SAMPLE}
INPUT_BAM=$PWD/whatshap/${SAMPLE}/${SAMPLE}.bam

${CONF_SINGLARITY_PATH} exec ${CONF_etltools_merge_tag_SINGULARITY_OPTION} \
    ${CONF_etltools_IMG} \
    ${INPUT_BAM} \
    ${OUTPUT_DIR} 