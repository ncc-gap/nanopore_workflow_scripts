configfile: "config.yml"

# snakemake --dryrun --dag > ./dag.dot
# dot -Tpng ./dag.dot > dag.png

chromosomes= 'chr1 chr2 chr3 chr4 chr5 chr6 chr7 chr8 chr9 chr10 chr11 chr12 chr13 chr14 chr15 chr16 chr17 chr18 chr19 chr20 chr21 chr22 chrX chrY'.split()

tumors = list(config["pair"].keys())
controls = list(set(config["pair"].values()))
samples = list(set(tumors + controls))
pairs = {}
for tumor in config["pair"]:
    control = config["pair"][tumor]
    pairs[tumor] = control
    pairs[control] = control

import os
for tumor in tumors:
    os.makedirs("log/" + tumor, exist_ok=True)
    os.makedirs("minimap2/" + tumor, exist_ok=True)
    os.makedirs("nanomonsv/" + tumor, exist_ok=True)
    os.makedirs("split/expand/" + tumor, exist_ok=True)
    os.makedirs("split/nanopolish/" + tumor, exist_ok=True)
    os.makedirs("whatshap/" + tumor, exist_ok=True)
    os.makedirs("nanopolish/" + tumor, exist_ok=True)

for control in controls:
    os.makedirs("log/" + control, exist_ok=True)
    os.makedirs("minimap2/" + control, exist_ok=True)
    os.makedirs("nanomonsv/" + control, exist_ok=True)
    os.makedirs("split/expand/" + control, exist_ok=True)
    os.makedirs("split/PMDV/" + control, exist_ok=True)
    os.makedirs("split/vep/" + control, exist_ok=True)
    os.makedirs("split/whatshap/" + tumor, exist_ok=True)
    os.makedirs("split/nanopolish/" + tumor, exist_ok=True)
    os.makedirs("vep/" + control, exist_ok=True)
    os.makedirs("whatshap/" + control, exist_ok=True)
    os.makedirs("nanopolish/" + tumor, exist_ok=True)

rule all:
    input:
        expand("whatshap/{sample}/haplotag.txt", sample=samples),
        expand("nanopolish/{sample}/methylation_calls.tsv.gz", sample=samples),
        expand("nanomonsv/{sample}/{sample}.nanomonsv.result.vcf", sample=tumors),
        expand("vep/{sample}/PMDV.annot.vcf.gz", sample=controls),

rule minimap2:
    input:
        fastq = lambda wildcards: config["fastq"][wildcards.sample],
    output:
        "minimap2/{sample}/{sample}.bam",
        "minimap2/{sample}/{sample}.bam.bai"
    params:
        script = "script/singularity_minimap2.sh {sample}",
        qsub_option = "-N {sample}_minimap2 -e ./log/{sample} -o ./log/{sample}"
    shell:
        "qsub {params.qsub_option} -sync y {params.script} {input.fastq}"

rule split:
    input:
        "minimap2/{sample}/{sample}.bam"
    output:
        expand("split/expand/{sample}/{chr}", chr=chromosomes, allow_missing=True)
    shell:
        "touch {output}"

rule PMDV:
    input:
        "split/expand/{sample}/{chr}"
    output:
        "split/PMDV/{sample}/{chr}/PMDV.vcf.gz",
        "split/PMDV/{sample}/{chr}/PMDV.vcf.gz.tbi"
    params:
        script = "script/singularity_PMDV.sh {sample} {chr}",
        qsub_option = "-N {sample}_PMDV_{chr} -e ./log/{sample} -o ./log/{sample}"
    shell:
        "qsub {params.qsub_option} -sync y {params.script}"

rule vep_annot:
    input:
        "split/PMDV/{sample}/{chr}/PMDV.vcf.gz"
    output:
        "split/vep/{sample}/{chr}/PMDV.annot.vcf.gz",
        "split/vep/{sample}/{chr}/PMDV.annot.vcf.gz.tbi"
    params:
        script = "script/singularity_vep_annot.sh {sample} {chr}",
        qsub_option = "-N {sample}_vep_annot_{chr} -e ./log/{sample} -o ./log/{sample}"
    shell:
        "qsub {params.qsub_option} -sync y {params.script}"

rule vep_annot_merge:
    input:
        expand("split/vep/{sample}/{chr}/PMDV.annot.vcf.gz", chr=chromosomes, allow_missing=True)
    output:
        "vep/{sample}/PMDV.annot.vcf.gz",
        "vep/{sample}/PMDV.annot.vcf.gz.tbi"
    params:
        script = "script/singularity_vep_annot_merge.sh {sample}",
        qsub_option = "-N {sample}_vep_annot_merge -e ./log/{sample} -o ./log/{sample}"
    shell:
        "qsub {params.qsub_option} -sync y {params.script}"

rule vep_filt:
    input:
        "split/vep/{sample}/{chr}/PMDV.annot.vcf.gz"
    output:
        "split/vep/{sample}/{chr}/PMDV.annot.filt.vcf.gz",
        "split/vep/{sample}/{chr}/PMDV.annot.filt.vcf.gz.tbi",
    params:
        script = "script/singularity_vep_filt.sh {sample} {chr}",
        qsub_option = "-N {sample}_vep_filt_{chr} -e ./log/{sample} -o ./log/{sample}"
    shell:
        "qsub {params.qsub_option} -sync y {params.script}"

rule whatshap_phase:
    input:
        "split/vep/{sample}/{chr}/PMDV.annot.filt.vcf.gz"
    output:
        "split/whatshap/{sample}/{chr}/phased.vcf.gz",
        "split/whatshap/{sample}/{chr}/phased.vcf.gz.tbi"
    params:
        script = "script/singularity_whatshap_phase.sh {sample} {chr}",
        qsub_option = "-N {sample}_whatshap_phase_{chr} -e ./log/{sample} -o ./log/{sample}"
    shell:
        "qsub {params.qsub_option} -sync y {params.script}"

rule whatshap_phase_merge:
    input:
        expand("split/whatshap/{sample}/{chr}/phased.vcf.gz", chr=chromosomes, allow_missing=True)
    output:
        "whatshap/{sample}/phased.vcf.gz",
        "whatshap/{sample}/phased.vcf.gz.tbi"
    params:
        script = "script/singularity_whatshap_phase_merge.sh {sample}",
        qsub_option = "-N {sample}_whatshap_phase_merge -e ./log/{sample} -o ./log/{sample}"
    shell:
        "qsub {params.qsub_option} -sync y {params.script}"

rule whatshap_haplotag:
    input:
        tumor= "minimap2/{sample}/{sample}.bam",
        control= lambda wildcards: "whatshap/{control}/phased.vcf.gz".format(control=pairs[wildcards.sample]),
    output:
        "whatshap/{sample}/haplotag.txt",
        "whatshap/{sample}/{sample}.bam",
        "whatshap/{sample}/{sample}.bam.bai"
    params:
        script = "script/singularity_whatshap_haplotag.sh {sample}",
        qsub_option = "-N {sample}_whatshap_haplotag -e ./log/{sample} -o ./log/{sample}"
    shell:
        "qsub {params.qsub_option} -sync y {params.script} {input.tumor} {input.control}"

rule nanopolish_index:
    input:
        fastq = lambda wildcards: config["fastq"][wildcards.sample],
    output:
        "nanopolish/{sample}/index"
    params:
        script = "script/singularity_nanopolish_index.sh {sample}",
        qsub_option = "-N {sample}_nanopolish_index -e ./log/{sample} -o ./log/{sample}",
        fast5 = lambda wildcards: config["fast5"][wildcards.sample]
    shell:
        "qsub {params.qsub_option} -sync y {params.script} {input.fastq} {params.fast5}"

rule nanopolish_methylation_calls:
    input:
        fastq = lambda wildcards: config["fastq"][wildcards.sample],
        bam = "whatshap/{sample}/{sample}.bam",
        index = "nanopolish/{sample}/index",
        split = "split/expand/{sample}/{chr}",
    output:
        "split/nanopolish/{sample}/{chr}/methylation_calls.tsv"
    params:
        script = "script/singularity_nanopolish_methylation_calls.sh {sample} {chr}",
        qsub_option = "-N {sample}_nanopolish_methylation_calls_{chr} -e ./log/{sample} -o ./log/{sample}",
    shell:
        "qsub {params.qsub_option} -sync y {params.script} {input.fastq}"

rule nanopolish_merge:
    input:
        expand("split/nanopolish/{sample}/{chr}/methylation_calls.tsv", chr=chromosomes, allow_missing=True)
    output:
        "nanopolish/{sample}/methylation_calls.tsv.gz"
    params:
        script = "script/singularity_nanopolish_merge.sh {sample}",
        qsub_option = "-N {sample}_nanopolish_merge -e ./log/{sample} -o ./log/{sample}"
    shell:
        "qsub {params.qsub_option} -sync y {params.script}"

rule nanomonsv_parse:
    input:
        "whatshap/{sample}/{sample}.bam"
    output:
        "nanomonsv/{sample}/{sample}.bp_info.sorted.bed.gz",
        "nanomonsv/{sample}/{sample}.bp_info.sorted.bed.gz.tbi"
    params:
        script = "script/singularity_nanomonsv_parse.sh {sample}",
        qsub_option = "-N {sample}_nanomonsv_parse -e ./log/{sample} -o ./log/{sample}"
    shell:
        "qsub {params.qsub_option} -sync y {params.script}"

rule nanomonsv_get:
    input:
        tumor = "nanomonsv/{sample}/{sample}.bp_info.sorted.bed.gz",
        control = lambda wildcards: "nanomonsv/{control}/{control}.bp_info.sorted.bed.gz".format(control=pairs[wildcards.sample]),
    output:
        "nanomonsv/{sample}/{sample}.nanomonsv.result.vcf"
    params:
        script = "script/singularity_nanomonsv_get.sh {sample}",
        qsub_option = "-N {sample}_nanomonsv_get -e ./log/{sample} -o ./log/{sample}"
    shell:
        "qsub {params.qsub_option} -sync y {params.script} {input.tumor} {input.control}"

