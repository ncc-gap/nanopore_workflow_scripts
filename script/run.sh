set -eux

PARAM_FILE=$1
source ${PARAM_FILE}

mkdir -p "log/"${PARAM_TUMOR}
mkdir -p "minimap2/"${PARAM_TUMOR}
mkdir -p "nanomonsv/"${PARAM_TUMOR}
mkdir -p "split/expand/"${PARAM_TUMOR}
mkdir -p "split/whatshap/"${PARAM_TUMOR}
mkdir -p "split/nanopolish/"${PARAM_TUMOR}
mkdir -p "whatshap/"${PARAM_TUMOR}
mkdir -p "nanopolish/"${PARAM_TUMOR}

mkdir -p "log/"${PARAM_CONTL}
mkdir -p "minimap2/"${PARAM_CONTL}
mkdir -p "nanomonsv/"${PARAM_CONTL}
mkdir -p "split/expand/"${PARAM_CONTL}
mkdir -p "split/PMDV/"${PARAM_CONTL}
mkdir -p "split/vep/"${PARAM_CONTL}
mkdir -p "PMDV/"${PARAM_CONTL}
mkdir -p "vep/"${PARAM_CONTL}
mkdir -p "whatshap/"${PARAM_CONTL}

QSUB_TUMOR="-e ./log/${PARAM_TUMOR} -o ./log/${PARAM_TUMOR}"
QSUB_CONTL="-e ./log/${PARAM_CONTL} -o ./log/${PARAM_CONTL}"

#rule minimap2:
qsub ${QSUB_TUMOR} -N ${PARAM_TUMOR}_minimap2 script/singularity_minimap2.sh ${PARAM_TUMOR} ${PARAM_TUMOR_FASTQ}
qsub ${QSUB_CONTL} -N ${PARAM_CONTL}_minimap2 script/singularity_minimap2.sh ${PARAM_CONTL} ${PARAM_CONTL_FASTQ}

#nanomonsv_parse:
qsub ${QSUB_TUMOR} -N ${PARAM_TUMOR}_nanomonsv_parse -hold_jid ${PARAM_TUMOR}_minimap2 script/singularity_nanomonsv_parse.sh ${PARAM_TUMOR}
qsub ${QSUB_CONTL} -N ${PARAM_TUMOR}_nanomonsv_parse -hold_jid ${PARAM_CONTL}_minimap2 script/singularity_nanomonsv_parse.sh ${PARAM_CONTL}

# rule nanomonsv_get:
INPUT_TUMOR=nanomonsv/${PARAM_TUMOR}/${PARAM_TUMOR}.bp_info.sorted.bed.gz
INPUT_CONTL=nanomonsv/${PARAM_CONTL}/${PARAM_CONTL}.bp_info.sorted.bed.gz
qsub ${QSUB_TUMOR} -N ${PARAM_TUMOR}_nanomonsv_get -hold_jid ${PARAM_TUMOR}_nanomonsv_parse script/singularity_nanomonsv_get.sh ${PARAM_TUMOR} ${INPUT_TUMOR} ${INPUT_CONTL}

for CHR in chr1 chr2 chr3 chr4 chr5 chr6 chr7 chr8 chr9 chr10 chr11 chr12 chr13 chr14 chr15 chr16 chr17 chr18 chr19 chr20 chr21 chr22 chrX chrY
do
    # rule PMDV:
    qsub ${QSUB_CONTL} -N ${PARAM_CONTL}_PMDV -hold_jid ${PARAM_CONTL}_minimap2 script/singularity_PMDV.sh ${PARAM_CONTL} ${CHR}
    
    # rule vep_annot:
    qsub ${QSUB_CONTL} -N ${PARAM_CONTL}_vep_annot -hold_jid ${PARAM_CONTL}_PMDV script/singularity_vep_annot.sh ${PARAM_CONTL} ${CHR}
    
    # rule vep_filt:
    qsub ${QSUB_CONTL} -N ${PARAM_CONTL}_vep_filt -hold_jid ${PARAM_CONTL}_vep_annot script/singularity_vep_filt.sh ${PARAM_CONTL} ${CHR}
    
    # rule whatshap_phase:
    qsub ${QSUB_CONTL} -N ${PARAM_CONTL}_whatshap_phase -hold_jid ${PARAM_CONTL}_vep_filt script/singularity_whatshap_phase.sh ${PARAM_CONTL} ${CHR}

    #rule nanopolish:
    qsub ${QSUB_TUMOR} -N ${PARAM_TUMOR}_nanopolish -hold_jid ${PARAM_TUMOR}_minimap2 script/singularity_nanopolish.sh ${PARAM_TUMOR} ${CHR} ${PARAM_TUMOR_FASTQ} ${PARAM_TUMOR_FAST5}
done

# rule vep_annot_merge:
qsub ${QSUB_CONTL} -N ${PARAM_CONTL}_vep_annot_merge -hold_jid ${PARAM_CONTL}_vep_annot script/singularity_vep_annot_merge.sh ${PARAM_CONTL}

# rule whatshap_phase_merge:
qsub ${QSUB_CONTL} -N ${PARAM_CONTL}_whatshap_phase_merge -hold_jid ${PARAM_CONTL}_whatshap_phase script/singularity_whatshap_phase_merge.sh ${PARAM_CONTL}

# rule whatshap_haplotag:
INPUT_TUMOR=minimap2/${PARAM_TUMOR}/${PARAM_TUMOR}.bam
INPUT_CONTL=whatshap/${PARAM_CONTL}/phased.vcf.gz
qsub ${QSUB_TUMOR} -N ${PARAM_TUMOR}_whatshap_haplotag -hold_jid ${PARAM_CONTL}_whatshap_phase_merge script/singularity_whatshap_haplotag.sh ${PARAM_TUMOR} ${INPUT_TUMOR} ${INPUT_CONTL}

# rule nanopolish_merge:
qsub ${QSUB_TUMOR} -N ${PARAM_TUMOR}_nanopolish_merge -hold_jid ${PARAM_TUMOR}_nanopolish script/singularity_nanopolish_merge.sh ${PARAM_TUMOR}
