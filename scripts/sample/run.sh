COMMON="-l gpu "

# minimap2

QSUB_OPTION=${COMMON}" -N minimap2_aokada_ALX_201229"
qsub ${QSUB_OPTION} /home/aokada/nanopore/tools/nanopore_workflow_scripts/scripts/ALX_201229/singularity_minimap2.sh

# nanopolish

QSUB_OPTION=${COMMON}"-hold_jid minimap2_aokada_ALX_201229 -N nanopolish_aokada_ALX_201229"
qsub /home/aokada/nanopore/tools/nanopore_workflow_scripts/scripts/ALX_201229/singularity_nanopolish.sh chr1
qsub /home/aokada/nanopore/tools/nanopore_workflow_scripts/scripts/ALX_201229/singularity_nanopolish.sh chr2
qsub /home/aokada/nanopore/tools/nanopore_workflow_scripts/scripts/ALX_201229/singularity_nanopolish.sh chr3
qsub /home/aokada/nanopore/tools/nanopore_workflow_scripts/scripts/ALX_201229/singularity_nanopolish.sh chr4
qsub /home/aokada/nanopore/tools/nanopore_workflow_scripts/scripts/ALX_201229/singularity_nanopolish.sh chr5
qsub /home/aokada/nanopore/tools/nanopore_workflow_scripts/scripts/ALX_201229/singularity_nanopolish.sh chr6
qsub /home/aokada/nanopore/tools/nanopore_workflow_scripts/scripts/ALX_201229/singularity_nanopolish.sh chr7
qsub /home/aokada/nanopore/tools/nanopore_workflow_scripts/scripts/ALX_201229/singularity_nanopolish.sh chr8
qsub /home/aokada/nanopore/tools/nanopore_workflow_scripts/scripts/ALX_201229/singularity_nanopolish.sh chr9
qsub /home/aokada/nanopore/tools/nanopore_workflow_scripts/scripts/ALX_201229/singularity_nanopolish.sh chr10
qsub /home/aokada/nanopore/tools/nanopore_workflow_scripts/scripts/ALX_201229/singularity_nanopolish.sh chr11
qsub /home/aokada/nanopore/tools/nanopore_workflow_scripts/scripts/ALX_201229/singularity_nanopolish.sh chr12
qsub /home/aokada/nanopore/tools/nanopore_workflow_scripts/scripts/ALX_201229/singularity_nanopolish.sh chr13
qsub /home/aokada/nanopore/tools/nanopore_workflow_scripts/scripts/ALX_201229/singularity_nanopolish.sh chr14
qsub /home/aokada/nanopore/tools/nanopore_workflow_scripts/scripts/ALX_201229/singularity_nanopolish.sh chr15
qsub /home/aokada/nanopore/tools/nanopore_workflow_scripts/scripts/ALX_201229/singularity_nanopolish.sh chr16
qsub /home/aokada/nanopore/tools/nanopore_workflow_scripts/scripts/ALX_201229/singularity_nanopolish.sh chr17
qsub /home/aokada/nanopore/tools/nanopore_workflow_scripts/scripts/ALX_201229/singularity_nanopolish.sh chr18
qsub /home/aokada/nanopore/tools/nanopore_workflow_scripts/scripts/ALX_201229/singularity_nanopolish.sh chr19
qsub /home/aokada/nanopore/tools/nanopore_workflow_scripts/scripts/ALX_201229/singularity_nanopolish.sh chr20
qsub /home/aokada/nanopore/tools/nanopore_workflow_scripts/scripts/ALX_201229/singularity_nanopolish.sh chr21
qsub /home/aokada/nanopore/tools/nanopore_workflow_scripts/scripts/ALX_201229/singularity_nanopolish.sh chr22
qsub /home/aokada/nanopore/tools/nanopore_workflow_scripts/scripts/ALX_201229/singularity_nanopolish.sh chrX
qsub /home/aokada/nanopore/tools/nanopore_workflow_scripts/scripts/ALX_201229/singularity_nanopolish.sh chrY

# medaka

QSUB_OPTION=${COMMON}"-hold_jid minimap2_aokada_ALX_201229 -N medaka_aokada_ALX_201229"
qsub ${QSUB_OPTION} /home/aokada/nanopore/tools/nanopore_workflow_scripts/scripts/ALX_201229/singularity_medaka_cpu.sh chr1
qsub ${QSUB_OPTION} /home/aokada/nanopore/tools/nanopore_workflow_scripts/scripts/ALX_201229/singularity_medaka_cpu.sh chr2
qsub ${QSUB_OPTION} /home/aokada/nanopore/tools/nanopore_workflow_scripts/scripts/ALX_201229/singularity_medaka_cpu.sh chr3
qsub ${QSUB_OPTION} /home/aokada/nanopore/tools/nanopore_workflow_scripts/scripts/ALX_201229/singularity_medaka_cpu.sh chr4
qsub ${QSUB_OPTION} /home/aokada/nanopore/tools/nanopore_workflow_scripts/scripts/ALX_201229/singularity_medaka_cpu.sh chr5
qsub ${QSUB_OPTION} /home/aokada/nanopore/tools/nanopore_workflow_scripts/scripts/ALX_201229/singularity_medaka_cpu.sh chr6
qsub ${QSUB_OPTION} /home/aokada/nanopore/tools/nanopore_workflow_scripts/scripts/ALX_201229/singularity_medaka_cpu.sh chr7
qsub ${QSUB_OPTION} /home/aokada/nanopore/tools/nanopore_workflow_scripts/scripts/ALX_201229/singularity_medaka_cpu.sh chr8
qsub ${QSUB_OPTION} /home/aokada/nanopore/tools/nanopore_workflow_scripts/scripts/ALX_201229/singularity_medaka_cpu.sh chr9
qsub ${QSUB_OPTION} /home/aokada/nanopore/tools/nanopore_workflow_scripts/scripts/ALX_201229/singularity_medaka_cpu.sh chr10
qsub ${QSUB_OPTION} /home/aokada/nanopore/tools/nanopore_workflow_scripts/scripts/ALX_201229/singularity_medaka_cpu.sh chr11
qsub ${QSUB_OPTION} /home/aokada/nanopore/tools/nanopore_workflow_scripts/scripts/ALX_201229/singularity_medaka_cpu.sh chr12
qsub ${QSUB_OPTION} /home/aokada/nanopore/tools/nanopore_workflow_scripts/scripts/ALX_201229/singularity_medaka_cpu.sh chr13
qsub ${QSUB_OPTION} /home/aokada/nanopore/tools/nanopore_workflow_scripts/scripts/ALX_201229/singularity_medaka_cpu.sh chr14
qsub ${QSUB_OPTION} /home/aokada/nanopore/tools/nanopore_workflow_scripts/scripts/ALX_201229/singularity_medaka_cpu.sh chr15
qsub ${QSUB_OPTION} /home/aokada/nanopore/tools/nanopore_workflow_scripts/scripts/ALX_201229/singularity_medaka_cpu.sh chr16
qsub ${QSUB_OPTION} /home/aokada/nanopore/tools/nanopore_workflow_scripts/scripts/ALX_201229/singularity_medaka_cpu.sh chr17
qsub ${QSUB_OPTION} /home/aokada/nanopore/tools/nanopore_workflow_scripts/scripts/ALX_201229/singularity_medaka_cpu.sh chr18
qsub ${QSUB_OPTION} /home/aokada/nanopore/tools/nanopore_workflow_scripts/scripts/ALX_201229/singularity_medaka_cpu.sh chr19
qsub ${QSUB_OPTION} /home/aokada/nanopore/tools/nanopore_workflow_scripts/scripts/ALX_201229/singularity_medaka_cpu.sh chr20
qsub ${QSUB_OPTION} /home/aokada/nanopore/tools/nanopore_workflow_scripts/scripts/ALX_201229/singularity_medaka_cpu.sh chr21
qsub ${QSUB_OPTION} /home/aokada/nanopore/tools/nanopore_workflow_scripts/scripts/ALX_201229/singularity_medaka_cpu.sh chr22
qsub ${QSUB_OPTION} /home/aokada/nanopore/tools/nanopore_workflow_scripts/scripts/ALX_201229/singularity_medaka_cpu.sh chrX
qsub ${QSUB_OPTION} /home/aokada/nanopore/tools/nanopore_workflow_scripts/scripts/ALX_201229/singularity_medaka_cpu.sh chrY

# vep (annotation)

QSUB_OPTION=${COMMON}"-hold_jid medaka_aokada_ALX_201229 -N vep_annot_aokada_ALX_201229"
qsub ${QSUB_OPTION} /home/aokada/nanopore/tools/nanopore_workflow_scripts/scripts/ALX_201229/singularity_vep_annot.sh chr1
qsub ${QSUB_OPTION} /home/aokada/nanopore/tools/nanopore_workflow_scripts/scripts/ALX_201229/singularity_vep_annot.sh chr2
qsub ${QSUB_OPTION} /home/aokada/nanopore/tools/nanopore_workflow_scripts/scripts/ALX_201229/singularity_vep_annot.sh chr3
qsub ${QSUB_OPTION} /home/aokada/nanopore/tools/nanopore_workflow_scripts/scripts/ALX_201229/singularity_vep_annot.sh chr4
qsub ${QSUB_OPTION} /home/aokada/nanopore/tools/nanopore_workflow_scripts/scripts/ALX_201229/singularity_vep_annot.sh chr5
qsub ${QSUB_OPTION} /home/aokada/nanopore/tools/nanopore_workflow_scripts/scripts/ALX_201229/singularity_vep_annot.sh chr6
qsub ${QSUB_OPTION} /home/aokada/nanopore/tools/nanopore_workflow_scripts/scripts/ALX_201229/singularity_vep_annot.sh chr7
qsub ${QSUB_OPTION} /home/aokada/nanopore/tools/nanopore_workflow_scripts/scripts/ALX_201229/singularity_vep_annot.sh chr8
qsub ${QSUB_OPTION} /home/aokada/nanopore/tools/nanopore_workflow_scripts/scripts/ALX_201229/singularity_vep_annot.sh chr9
qsub ${QSUB_OPTION} /home/aokada/nanopore/tools/nanopore_workflow_scripts/scripts/ALX_201229/singularity_vep_annot.sh chr10
qsub ${QSUB_OPTION} /home/aokada/nanopore/tools/nanopore_workflow_scripts/scripts/ALX_201229/singularity_vep_annot.sh chr11
qsub ${QSUB_OPTION} /home/aokada/nanopore/tools/nanopore_workflow_scripts/scripts/ALX_201229/singularity_vep_annot.sh chr12
qsub ${QSUB_OPTION} /home/aokada/nanopore/tools/nanopore_workflow_scripts/scripts/ALX_201229/singularity_vep_annot.sh chr13
qsub ${QSUB_OPTION} /home/aokada/nanopore/tools/nanopore_workflow_scripts/scripts/ALX_201229/singularity_vep_annot.sh chr14
qsub ${QSUB_OPTION} /home/aokada/nanopore/tools/nanopore_workflow_scripts/scripts/ALX_201229/singularity_vep_annot.sh chr15
qsub ${QSUB_OPTION} /home/aokada/nanopore/tools/nanopore_workflow_scripts/scripts/ALX_201229/singularity_vep_annot.sh chr16
qsub ${QSUB_OPTION} /home/aokada/nanopore/tools/nanopore_workflow_scripts/scripts/ALX_201229/singularity_vep_annot.sh chr17
qsub ${QSUB_OPTION} /home/aokada/nanopore/tools/nanopore_workflow_scripts/scripts/ALX_201229/singularity_vep_annot.sh chr18
qsub ${QSUB_OPTION} /home/aokada/nanopore/tools/nanopore_workflow_scripts/scripts/ALX_201229/singularity_vep_annot.sh chr19
qsub ${QSUB_OPTION} /home/aokada/nanopore/tools/nanopore_workflow_scripts/scripts/ALX_201229/singularity_vep_annot.sh chr20
qsub ${QSUB_OPTION} /home/aokada/nanopore/tools/nanopore_workflow_scripts/scripts/ALX_201229/singularity_vep_annot.sh chr21
qsub ${QSUB_OPTION} /home/aokada/nanopore/tools/nanopore_workflow_scripts/scripts/ALX_201229/singularity_vep_annot.sh chr22
qsub ${QSUB_OPTION} /home/aokada/nanopore/tools/nanopore_workflow_scripts/scripts/ALX_201229/singularity_vep_annot.sh chrX
qsub ${QSUB_OPTION} /home/aokada/nanopore/tools/nanopore_workflow_scripts/scripts/ALX_201229/singularity_vep_annot.sh chrY

# vep merge

QSUB_OPTION=${COMMON}"-hold_jid vep_annot_aokada_ALX_201229 -N vep_annot_merge_aokada_ALX_201229"
qsub ${QSUB_OPTION} /home/aokada/nanopore/tools/nanopore_workflow_scripts/scripts/ALX_201229/singularity_vep_annot_merge.sh

# vep (filter)

QSUB_OPTION=${COMMON}"-hold_jid vep_annot_aokada_ALX_201229 -N vep_filt_aokada_ALX_201229"
qsub ${QSUB_OPTION} /home/aokada/nanopore/tools/nanopore_workflow_scripts/scripts/ALX_201229/singularity_vep_filt.sh chr1
qsub ${QSUB_OPTION} /home/aokada/nanopore/tools/nanopore_workflow_scripts/scripts/ALX_201229/singularity_vep_filt.sh chr2
qsub ${QSUB_OPTION} /home/aokada/nanopore/tools/nanopore_workflow_scripts/scripts/ALX_201229/singularity_vep_filt.sh chr3
qsub ${QSUB_OPTION} /home/aokada/nanopore/tools/nanopore_workflow_scripts/scripts/ALX_201229/singularity_vep_filt.sh chr4
qsub ${QSUB_OPTION} /home/aokada/nanopore/tools/nanopore_workflow_scripts/scripts/ALX_201229/singularity_vep_filt.sh chr5
qsub ${QSUB_OPTION} /home/aokada/nanopore/tools/nanopore_workflow_scripts/scripts/ALX_201229/singularity_vep_filt.sh chr6
qsub ${QSUB_OPTION} /home/aokada/nanopore/tools/nanopore_workflow_scripts/scripts/ALX_201229/singularity_vep_filt.sh chr7
qsub ${QSUB_OPTION} /home/aokada/nanopore/tools/nanopore_workflow_scripts/scripts/ALX_201229/singularity_vep_filt.sh chr8
qsub ${QSUB_OPTION} /home/aokada/nanopore/tools/nanopore_workflow_scripts/scripts/ALX_201229/singularity_vep_filt.sh chr9
qsub ${QSUB_OPTION} /home/aokada/nanopore/tools/nanopore_workflow_scripts/scripts/ALX_201229/singularity_vep_filt.sh chr10
qsub ${QSUB_OPTION} /home/aokada/nanopore/tools/nanopore_workflow_scripts/scripts/ALX_201229/singularity_vep_filt.sh chr11
qsub ${QSUB_OPTION} /home/aokada/nanopore/tools/nanopore_workflow_scripts/scripts/ALX_201229/singularity_vep_filt.sh chr12
qsub ${QSUB_OPTION} /home/aokada/nanopore/tools/nanopore_workflow_scripts/scripts/ALX_201229/singularity_vep_filt.sh chr13
qsub ${QSUB_OPTION} /home/aokada/nanopore/tools/nanopore_workflow_scripts/scripts/ALX_201229/singularity_vep_filt.sh chr14
qsub ${QSUB_OPTION} /home/aokada/nanopore/tools/nanopore_workflow_scripts/scripts/ALX_201229/singularity_vep_filt.sh chr15
qsub ${QSUB_OPTION} /home/aokada/nanopore/tools/nanopore_workflow_scripts/scripts/ALX_201229/singularity_vep_filt.sh chr16
qsub ${QSUB_OPTION} /home/aokada/nanopore/tools/nanopore_workflow_scripts/scripts/ALX_201229/singularity_vep_filt.sh chr17
qsub ${QSUB_OPTION} /home/aokada/nanopore/tools/nanopore_workflow_scripts/scripts/ALX_201229/singularity_vep_filt.sh chr18
qsub ${QSUB_OPTION} /home/aokada/nanopore/tools/nanopore_workflow_scripts/scripts/ALX_201229/singularity_vep_filt.sh chr19
qsub ${QSUB_OPTION} /home/aokada/nanopore/tools/nanopore_workflow_scripts/scripts/ALX_201229/singularity_vep_filt.sh chr20
qsub ${QSUB_OPTION} /home/aokada/nanopore/tools/nanopore_workflow_scripts/scripts/ALX_201229/singularity_vep_filt.sh chr21
qsub ${QSUB_OPTION} /home/aokada/nanopore/tools/nanopore_workflow_scripts/scripts/ALX_201229/singularity_vep_filt.sh chr22
qsub ${QSUB_OPTION} /home/aokada/nanopore/tools/nanopore_workflow_scripts/scripts/ALX_201229/singularity_vep_filt.sh chrX
qsub ${QSUB_OPTION} /home/aokada/nanopore/tools/nanopore_workflow_scripts/scripts/ALX_201229/singularity_vep_filt.sh chrY

# whatshap phase

QSUB_OPTION=${COMMON}"-hold_jid vep_filt_aokada_ALX_201229 -N whatshap_phase_aokada_ALX_201229"
qsub ${QSUB_OPTION} /home/aokada/nanopore/tools/nanopore_workflow_scripts/scripts/ALX_201229/singularity_whatshap_phase.sh chr1
qsub ${QSUB_OPTION} /home/aokada/nanopore/tools/nanopore_workflow_scripts/scripts/ALX_201229/singularity_whatshap_phase.sh chr2
qsub ${QSUB_OPTION} /home/aokada/nanopore/tools/nanopore_workflow_scripts/scripts/ALX_201229/singularity_whatshap_phase.sh chr3
qsub ${QSUB_OPTION} /home/aokada/nanopore/tools/nanopore_workflow_scripts/scripts/ALX_201229/singularity_whatshap_phase.sh chr4
qsub ${QSUB_OPTION} /home/aokada/nanopore/tools/nanopore_workflow_scripts/scripts/ALX_201229/singularity_whatshap_phase.sh chr5
qsub ${QSUB_OPTION} /home/aokada/nanopore/tools/nanopore_workflow_scripts/scripts/ALX_201229/singularity_whatshap_phase.sh chr6
qsub ${QSUB_OPTION} /home/aokada/nanopore/tools/nanopore_workflow_scripts/scripts/ALX_201229/singularity_whatshap_phase.sh chr7
qsub ${QSUB_OPTION} /home/aokada/nanopore/tools/nanopore_workflow_scripts/scripts/ALX_201229/singularity_whatshap_phase.sh chr8
qsub ${QSUB_OPTION} /home/aokada/nanopore/tools/nanopore_workflow_scripts/scripts/ALX_201229/singularity_whatshap_phase.sh chr9
qsub ${QSUB_OPTION} /home/aokada/nanopore/tools/nanopore_workflow_scripts/scripts/ALX_201229/singularity_whatshap_phase.sh chr10
qsub ${QSUB_OPTION} /home/aokada/nanopore/tools/nanopore_workflow_scripts/scripts/ALX_201229/singularity_whatshap_phase.sh chr11
qsub ${QSUB_OPTION} /home/aokada/nanopore/tools/nanopore_workflow_scripts/scripts/ALX_201229/singularity_whatshap_phase.sh chr12
qsub ${QSUB_OPTION} /home/aokada/nanopore/tools/nanopore_workflow_scripts/scripts/ALX_201229/singularity_whatshap_phase.sh chr13
qsub ${QSUB_OPTION} /home/aokada/nanopore/tools/nanopore_workflow_scripts/scripts/ALX_201229/singularity_whatshap_phase.sh chr14
qsub ${QSUB_OPTION} /home/aokada/nanopore/tools/nanopore_workflow_scripts/scripts/ALX_201229/singularity_whatshap_phase.sh chr15
qsub ${QSUB_OPTION} /home/aokada/nanopore/tools/nanopore_workflow_scripts/scripts/ALX_201229/singularity_whatshap_phase.sh chr16
qsub ${QSUB_OPTION} /home/aokada/nanopore/tools/nanopore_workflow_scripts/scripts/ALX_201229/singularity_whatshap_phase.sh chr17
qsub ${QSUB_OPTION} /home/aokada/nanopore/tools/nanopore_workflow_scripts/scripts/ALX_201229/singularity_whatshap_phase.sh chr18
qsub ${QSUB_OPTION} /home/aokada/nanopore/tools/nanopore_workflow_scripts/scripts/ALX_201229/singularity_whatshap_phase.sh chr19
qsub ${QSUB_OPTION} /home/aokada/nanopore/tools/nanopore_workflow_scripts/scripts/ALX_201229/singularity_whatshap_phase.sh chr20
qsub ${QSUB_OPTION} /home/aokada/nanopore/tools/nanopore_workflow_scripts/scripts/ALX_201229/singularity_whatshap_phase.sh chr21
qsub ${QSUB_OPTION} /home/aokada/nanopore/tools/nanopore_workflow_scripts/scripts/ALX_201229/singularity_whatshap_phase.sh chr22
qsub ${QSUB_OPTION} /home/aokada/nanopore/tools/nanopore_workflow_scripts/scripts/ALX_201229/singularity_whatshap_phase.sh chrX
qsub ${QSUB_OPTION} /home/aokada/nanopore/tools/nanopore_workflow_scripts/scripts/ALX_201229/singularity_whatshap_phase.sh chrY

# whatshap phase merge

QSUB_OPTION=${COMMON}"-hold_jid whatshap_phase_aokada_ALX_201229 -N whatshap_phase_merge_aokada_ALX_201229"
qsub ${QSUB_OPTION} /home/aokada/nanopore/tools/nanopore_workflow_scripts/scripts/ALX_201229/singularity_whatshap_phase_merge.sh

# whatshap haplotag

QSUB_OPTION=${COMMON}"-hold_jid whatshap_phase_merge_aokada_ALX_201229 -N whatshap_haplotag_aokada_ALX_201229"
qsub ${QSUB_OPTION} /home/aokada/nanopore/tools/nanopore_workflow_scripts/scripts/ALX_201229/singularity_whatshap_haplotag.sh
