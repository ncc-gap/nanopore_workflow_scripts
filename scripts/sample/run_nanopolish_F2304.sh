COMMON="-l gpu "

#
## nanopolish
#
QSUB_OPTION=${COMMON}"-N samtools_aokada_ALX_201229"
qsub ${QSUB_OPTION} /home/aokada/nanopore/tools/nanopore_workflow_scripts/scripts/ALX_201229/singularity_samtools_F2304.sh
QSUB_OPTION=${COMMON}"-hold_jid samtools_aokada_ALX_201229 -N nanopolish_aokada_ALX_201229"
qsub ${QSUB_OPTION} /home/aokada/nanopore/tools/nanopore_workflow_scripts/scripts/ALX_201229/singularity_nanopolish_F2304.sh chr1
qsub ${QSUB_OPTION} /home/aokada/nanopore/tools/nanopore_workflow_scripts/scripts/ALX_201229/singularity_nanopolish_F2304.sh chr2
qsub ${QSUB_OPTION} /home/aokada/nanopore/tools/nanopore_workflow_scripts/scripts/ALX_201229/singularity_nanopolish_F2304.sh chr3
qsub ${QSUB_OPTION} /home/aokada/nanopore/tools/nanopore_workflow_scripts/scripts/ALX_201229/singularity_nanopolish_F2304.sh chr4
qsub ${QSUB_OPTION} /home/aokada/nanopore/tools/nanopore_workflow_scripts/scripts/ALX_201229/singularity_nanopolish_F2304.sh chr5
qsub ${QSUB_OPTION} /home/aokada/nanopore/tools/nanopore_workflow_scripts/scripts/ALX_201229/singularity_nanopolish_F2304.sh chr6
qsub ${QSUB_OPTION} /home/aokada/nanopore/tools/nanopore_workflow_scripts/scripts/ALX_201229/singularity_nanopolish_F2304.sh chr7
qsub ${QSUB_OPTION} /home/aokada/nanopore/tools/nanopore_workflow_scripts/scripts/ALX_201229/singularity_nanopolish_F2304.sh chr8
qsub ${QSUB_OPTION} /home/aokada/nanopore/tools/nanopore_workflow_scripts/scripts/ALX_201229/singularity_nanopolish_F2304.sh chr9
qsub ${QSUB_OPTION} /home/aokada/nanopore/tools/nanopore_workflow_scripts/scripts/ALX_201229/singularity_nanopolish_F2304.sh chr10
qsub ${QSUB_OPTION} /home/aokada/nanopore/tools/nanopore_workflow_scripts/scripts/ALX_201229/singularity_nanopolish_F2304.sh chr11
qsub ${QSUB_OPTION} /home/aokada/nanopore/tools/nanopore_workflow_scripts/scripts/ALX_201229/singularity_nanopolish_F2304.sh chr12
qsub ${QSUB_OPTION} /home/aokada/nanopore/tools/nanopore_workflow_scripts/scripts/ALX_201229/singularity_nanopolish_F2304.sh chr13
qsub ${QSUB_OPTION} /home/aokada/nanopore/tools/nanopore_workflow_scripts/scripts/ALX_201229/singularity_nanopolish_F2304.sh chr14
qsub ${QSUB_OPTION} /home/aokada/nanopore/tools/nanopore_workflow_scripts/scripts/ALX_201229/singularity_nanopolish_F2304.sh chr15
qsub ${QSUB_OPTION} /home/aokada/nanopore/tools/nanopore_workflow_scripts/scripts/ALX_201229/singularity_nanopolish_F2304.sh chr16
qsub ${QSUB_OPTION} /home/aokada/nanopore/tools/nanopore_workflow_scripts/scripts/ALX_201229/singularity_nanopolish_F2304.sh chr17
qsub ${QSUB_OPTION} /home/aokada/nanopore/tools/nanopore_workflow_scripts/scripts/ALX_201229/singularity_nanopolish_F2304.sh chr18
qsub ${QSUB_OPTION} /home/aokada/nanopore/tools/nanopore_workflow_scripts/scripts/ALX_201229/singularity_nanopolish_F2304.sh chr19
qsub ${QSUB_OPTION} /home/aokada/nanopore/tools/nanopore_workflow_scripts/scripts/ALX_201229/singularity_nanopolish_F2304.sh chr20
qsub ${QSUB_OPTION} /home/aokada/nanopore/tools/nanopore_workflow_scripts/scripts/ALX_201229/singularity_nanopolish_F2304.sh chr21
qsub ${QSUB_OPTION} /home/aokada/nanopore/tools/nanopore_workflow_scripts/scripts/ALX_201229/singularity_nanopolish_F2304.sh chr22
qsub ${QSUB_OPTION} /home/aokada/nanopore/tools/nanopore_workflow_scripts/scripts/ALX_201229/singularity_nanopolish_F2304.sh chrX
qsub ${QSUB_OPTION} /home/aokada/nanopore/tools/nanopore_workflow_scripts/scripts/ALX_201229/singularity_nanopolish_F2304.sh chrY

QSUB_OPTION=${COMMON}"-hold_jid nanopolish_aokada_ALX_201229 -N nanopolish_merge_aokada_ALX_201229"
qsub ${QSUB_OPTION} /home/aokada/nanopore/tools/nanopore_workflow_scripts/scripts/ALX_201229/singularity_nanopolish_F2304_merge.sh

