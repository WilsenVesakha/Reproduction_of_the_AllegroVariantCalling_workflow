FILES = glob_wildcards("/workspace/test_cv_10_5/AllegroVariantCalling/seqs/{sample}.fastq.gz")
SAMPLES = FILES.sample
rule all:
    input:
        expand("/workspace/test_cv_10_5/AllegroVariantCalling/intermediates/{sample}.bam", sample=SAMPLES)

rule index_bam:
    input:
        sample="/workspace/test_cv_10_5/AllegroVariantCalling/intermediates/{sample}_rg.bam"
    output:
        "/workspace/test_cv_10_5/AllegroVariantCalling/intermediates/{sample}_rg.bam"
    log:
        "/workspace/test_cv_10_5/AllegroVariantCalling/logs/index_bam_{sample}.log"
    conda:
        "../envs/bowtie2_samtools.yml"
    shell:
        "samtools index samtools {output}"
