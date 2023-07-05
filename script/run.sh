set -eux

PARAM_FILE=$1
source ${PARAM_FILE}

mkdir -p "log/"${PARAM_TUMOR}
mkdir -p "minimap2/"${PARAM_TUMOR}
mkdir -p "nanomonsv/"${PARAM_TUMOR}
mkdir -p "methylation/"${PARAM_TUMOR}
mkdir -p "whatshap/"${PARAM_TUMOR}

mkdir -p "log/"${PARAM_CONTL}
mkdir -p "minimap2/"${PARAM_CONTL}
mkdir -p "nanomonsv/"${PARAM_CONTL}
mkdir -p "split/PMDV/"${PARAM_CONTL}
mkdir -p "split/vep/"${PARAM_CONTL}
mkdir -p "split/whatshap/"${PARAM_CONTL}
mkdir -p "methylation/"${PARAM_CONTL}
mkdir -p "vep/"${PARAM_CONTL}
mkdir -p "whatshap/"${PARAM_CONTL}

QSUB_TUMOR="-e ./log/${PARAM_TUMOR} -o ./log/${PARAM_TUMOR}"
QSUB_CONTL="-e ./log/${PARAM_CONTL} -o ./log/${PARAM_CONTL}"


#rule minimap2:
qsub ${QSUB_TUMOR} -N ${PARAM_TUMOR}_minimap2 ${SCRIPT}/singularity_minimap2.sh ${PARAM_TUMOR} ${PARAM_TUMOR_FASTQ} ${PARAM_DATA}
if [ ${PARAM_TUMOR} != ${PARAM_CONTL} ]
then
    qsub ${QSUB_CONTL} -N ${PARAM_CONTL}_minimap2 ${SCRIPT}/singularity_minimap2.sh ${PARAM_CONTL} ${PARAM_CONTL_FASTQ} ${PARAM_DATA}
fi

for CHR in chr1 chr2 chr3 chr4 chr5 chr6 chr7 chr8 chr9 chr10 chr11 chr12 chr13 chr14 chr15 chr16 chr17 chr18 chr19 chr20 chr21 chr22 chrX chrY
do
    # rule PMDV:
    qsub ${QSUB_CONTL} -N ${PARAM_CONTL}_PMDV -hold_jid ${PARAM_CONTL}_minimap2 ${SCRIPT}/singularity_PMDV.sh ${PARAM_CONTL} ${CHR} ${PARAM_DATA}
    
    # rule vep_annot:
    qsub ${QSUB_CONTL} -N ${PARAM_CONTL}_vep_annot -hold_jid ${PARAM_CONTL}_PMDV ${SCRIPT}/singularity_vep_annot.sh ${PARAM_CONTL} ${CHR} 
    
    # rule vep_filt:
    qsub ${QSUB_CONTL} -N ${PARAM_CONTL}_vep_filt -hold_jid ${PARAM_CONTL}_vep_annot ${SCRIPT}/singularity_vep_filt.sh ${PARAM_CONTL} ${CHR}
    
    # rule whatshap_phase:
    qsub ${QSUB_CONTL} -N ${PARAM_CONTL}_whatshap_phase -hold_jid ${PARAM_CONTL}_vep_filt ${SCRIPT}/singularity_whatshap_phase.sh ${PARAM_CONTL} ${CHR}

    # rule Genomon_Fisher:
    if [ ${PARAM_DATA} = "HiFi" ]
    then
        mkdir -p "split/GenomonFisher/"${PARAM_TUMOR}
        INPUT_BAM=minimap2/${PARAM_TUMOR}/${PARAM_TUMOR}.bam
        qsub ${QSUB_TUMOR} -N ${PARAM_TUMOR}_Genomon_Fisher -hold_jid ${PARAM_TUMOR}_minimap2 -hold_jid ${PARAM_CONTL}_minimap2 ${SCRIPT}/singularity_GenomonFisher.sh ${PARAM_TUMOR} ${INPUT_BAM} ${CHR}
        if [ ${PARAM_CONTL} != ${PARAM_TUMOR} ]
        then
            mkdir -p "split/GenomonFisher/pileup/"${PARAM_TUMOR}
            qsub ${QSUB_TUMOR} -N ${PARAM_TUMOR}_aggregate_mpileup -hold_jid ${PARAM_TUMOR}_Genomon_Fisher ${SCRIPT}/singularity_aggregate_mpileup.sh ${PARAM_TUMOR} ${CHR}
            fi
    fi 
done

# rule vep_annot_merge:
qsub ${QSUB_CONTL} -N ${PARAM_CONTL}_vep_annot_merge -hold_jid ${PARAM_CONTL}_vep_annot ${SCRIPT}/singularity_vep_annot_merge.sh ${PARAM_CONTL}

# rule whatshap_phase_merge:
qsub ${QSUB_CONTL} -N ${PARAM_CONTL}_whatshap_phase_merge -hold_jid ${PARAM_CONTL}_whatshap_phase ${SCRIPT}/singularity_whatshap_phase_merge.sh ${PARAM_CONTL}

# rule whatshap_haplotag:
INPUT_BAM=minimap2/${PARAM_TUMOR}/${PARAM_TUMOR}.bam
INPUT_PHASED=whatshap/${PARAM_CONTL}/phased.vcf.gz
qsub ${QSUB_TUMOR} -N ${PARAM_TUMOR}_whatshap_haplotag -hold_jid ${PARAM_CONTL}_whatshap_phase_merge ${SCRIPT}/singularity_whatshap_haplotag.sh ${PARAM_TUMOR} ${INPUT_BAM} ${INPUT_PHASED}
if [ ${PARAM_TUMOR} != ${PARAM_CONTL} ]
then
    INPUT_BAM=minimap2/${PARAM_CONTL}/${PARAM_CONTL}.bam
    qsub ${QSUB_CONTL} -N ${PARAM_CONTL}_whatshap_haplotag -hold_jid ${PARAM_CONTL}_whatshap_phase_merge ${SCRIPT}/singularity_whatshap_haplotag.sh ${PARAM_CONTL} ${INPUT_BAM} ${INPUT_PHASED}
fi


# rule etltools:
if [ ${METHYLATION_FLAG} = "Yes" ]
then
    qsub ${QSUB_TUMOR} -N ${PARAM_TUMOR}_etltools -hold_jid ${PARAM_TUMOR}_whatshap_haplotag ${SCRIPT}/singularity_etltools.sh ${PARAM_TUMOR} ${PARAM_TUMOR_BAM}
    if [ ${PARAM_TUMOR} != ${PARAM_CONTL} ]
    then
        qsub ${QSUB_CONTL} -N ${PARAM_CONTL}_etltools -hold_jid ${PARAM_CONTL}_whatshap_haplotag ${SCRIPT}/singularity_etltools.sh ${PARAM_CONTL} ${PARAM_CONTL_BAM}
    fi
fi

#nanomonsv_parse:
qsub ${QSUB_TUMOR} -N ${PARAM_TUMOR}_nanomonsv_parse -hold_jid ${PARAM_TUMOR}_whatshap_haplotag ${SCRIPT}/singularity_nanomonsv_parse.sh ${PARAM_TUMOR}
if [ ${PARAM_TUMOR} != ${PARAM_CONTL} ]
then
    qsub ${QSUB_CONTL} -N ${PARAM_CONTL}_nanomonsv_parse -hold_jid ${PARAM_CONTL}_whatshap_haplotag ${SCRIPT}/singularity_nanomonsv_parse.sh ${PARAM_CONTL}
fi

# rule nanomonsv_get:
INPUT_TUMOR=nanomonsv/${PARAM_TUMOR}/${PARAM_TUMOR}.bp_info.sorted.bed.gz
INPUT_CONTL=nanomonsv/${PARAM_CONTL}/${PARAM_CONTL}.bp_info.sorted.bed.gz
qsub ${QSUB_TUMOR} -N ${PARAM_TUMOR}_nanomonsv_get -hold_jid ${PARAM_TUMOR}_nanomonsv_parse ${SCRIPT}/singularity_nanomonsv_get.sh ${PARAM_TUMOR} ${INPUT_TUMOR} ${INPUT_CONTL}
