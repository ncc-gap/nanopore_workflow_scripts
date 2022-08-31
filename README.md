# nanopore_workflow_scripts

## setup

1. このリポジトリをダウンロード

2. pull singularity image

```
singularity pull docker://aokad/minimap2:2.24
singularity pull docker://aokad/medaka:20220829-cpu
singularity pull docker://kishwars/pepper_deepvariant:r0.8
singularity pull docker://aokad/nanopolish:0.14.0
singularity pull docker://aokad/ensembl-vep:20220216
singularity pull docker://friend1ws/nanomonsv:v0.5.0
```

3. リファレンスゲノムをダウンロード

4. scriptのパスを編集

script/common/*.sh
```
REFERENCE=xxx
```

script/sample/singularity_*.sh
```
IMAGE=xxx
SCRIPT_DIR=xxx
OUTPUT_ROOT="固定ならここで変えておく"
```

## run

実行フロー

![image](https://user-images.githubusercontent.com/13672949/185896507-4f7dae2e-7ce3-4d1e-b038-41643f486304.png)

※1 guppyは終了しているものとする  

1. scripts/sample ディレクトリをコピー

サンプルのパスに合わせてスクリプトのパスを編集する。  
tumorとnormalサンプルがある場合は以下のように配置する。

```
sample1_tumor
 - run_nanopolish.sh
 - singularity_minimap2.sh
 - singularity_nanopolish.sh
 - singularity_whatshap_haplotag.sh

sample1_normal
 - run_medaka_cpu.sh
 - run_whatshap_whase.sh
 - singularity_pepper.sh
 - singularity_minimap2.sh
 - singularity_whatshap_phase.sh
```

3. ジョブの投入

全実行

```
bash run.sh
```
