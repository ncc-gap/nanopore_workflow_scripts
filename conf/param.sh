# global
CONF_SINGLARITY_PATH=singularity

# minimap2

CONF_MINIMAP2_IMG=/home/aiokada/sandbox/nanopore_workflow_dev/image/minimap2_2.24.sif
CONF_MINIMAP2_SINGULARITY_OPTION=
CONF_MINIMAP2_REFERENCE=/home/aiokada/resources/database/hg38/v0/Homo_sapiens_assembly38.fasta

# nanomonsv-parse

CONF_NANOMONSV_PARSE_IMG=/home/aiokada/sandbox/nanopore_workflow_dev/image/nanomonsv_v0.5.0.sif
CONF_NANOMONSV_PARSE_SINGULARITY_OPTION=

# nanomonsv-get

CONF_NANOMONSV_GET_IMG=/home/aiokada/sandbox/nanopore_workflow_dev/image/nanomonsv_v0.5.0.sif
CONF_NANOMONSV_GET_SINGULARITY_OPTION=
CONF_NANOMONSV_GET_REFERENCE=/home/aiokada/resources/database/hg38/v0/Homo_sapiens_assembly38.fasta
CONF_NANOMONSV_GET_CONTROLPANEL_PREFIX=/home/aiokada/resources/control_panel/hprc_year1_data_freeze_nanopore_minimap2_2_24_merge_control/hprc_year1_data_freeze_nanopore_minimap2_2_24_merge_control

# PMDV (PEPPER-Margin-DeepVariant)

CONF_PMDV_IMG=/home/aiokada/sandbox/nanopore_workflow_dev/image/pepper_deepvariant_r0.8.sif
CONF_PMDV_SINGULARITY_OPTION=
CONF_PMDV_REFERENCE=/home/aiokada/resources/database/hg38/v0/Homo_sapiens_assembly38.fasta

#vep-annot

CONF_VEP_ANNOT_IMG=/home/aiokada/sandbox/nanopore_workflow_dev/image/ensembl-vep_20220216.sif
CONF_VEP_ANNOT_SINGULARITY_OPTION=
CONF_VEP_ANNOT_REFERENCE=/home/aiokada/resources/database/hg38/v0/Homo_sapiens_assembly38.fasta
CONF_VEP_ANNOT_DIR_CACHE=/home/aiokada/resources/ensembl-vep/vep_105/vep_data
CONF_VEP_ANNOT_PLUGINS=/home/aiokada/resources/ensembl-vep/vep_105/vep_data/Plugins
CONF_VEP_ANNOT_GNOMAD=/home/aiokada/resources/ensembl-vep/database/gnomAD_3.1.2/gnomad.genomes.v3.1.2.sites.merged.light.vcf.bgz

#vep-annot-merge

CONF_VEP_ANNOT_MERGE_IMG=/home/aiokada/sandbox/nanopore_workflow_dev/image/minimap2_2.24.sif
CONF_VEP_ANNOT_MERGE_SINGULARITY_OPTION=

#vep-filt

CONF_VEP_FILT_IMG=/home/aiokada/sandbox/nanopore_workflow_dev/image/minimap2_2.24.sif
CONF_VEP_FILT_SINGULARITY_OPTION=

#whatshap-phase

CONF_WHATSHAP_PHASE_IMG=/home/aiokada/sandbox/nanopore_workflow_dev/image/whatshap_1.5.sif
CONF_WHATSHAP_PHASE_SINGULARITY_OPTION=
CONF_WHATSHAP_PHASE_REFERENCE=/home/aiokada/resources/database/hg38/v0/Homo_sapiens_assembly38.fasta

#vep-whatshap-phase-merge

CONF_WHATSHAP_PHASE_MERGE_IMG=/home/aiokada/sandbox/nanopore_workflow_dev/image/whatshap_1.5.sif
CONF_WHATSHAP_PHASE_MERGE_SINGULARITY_OPTION=

#whatshap-haplotag

CONF_WHATSHAP_HAPLOTAG_IMG=/home/aiokada/sandbox/nanopore_workflow_dev/image/whatshap_1.5.sif
CONF_WHATSHAP_HAPLOTAG_SINGULARITY_OPTION=
CONF_WHATSHAP_HAPLOTAG_REFERENCE=/home/aiokada/resources/database/hg38/v0/Homo_sapiens_assembly38.fasta

#nanopolish

CONF_NANOPOLISH_IMG=/home/aiokada/sandbox/nanopore_workflow_dev/image/nanopolish_0.14.0.sif
CONF_NANOPOLISH_SINGULARITY_OPTION=
CONF_NANOPOLISH_REFERENCE=/home/aiokada/resources/database/hg38/v0/Homo_sapiens_assembly38.fasta

#nanopolish-merge

CONF_NANOPOLISH_MERGE_IMG=/home/aiokada/sandbox/nanopore_workflow_dev/image/minimap2_2.24.sif
CONF_NANOPOLISH_MERGE_SINGULARITY_OPTION=

