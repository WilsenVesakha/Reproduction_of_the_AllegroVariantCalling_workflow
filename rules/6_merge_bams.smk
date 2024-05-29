FILES = glob_wildcards("seqs/{sample}.fastq.gz")
SAMPLES = FILES.sample
rule merge_bams:
    input: 
        bams = expand("/workspace/test_cv_10_5/AllegroVariantCalling/intermediates/{sample}_rg.bam", sample=SAMPLES)
    output:
        "merged.bam"
    log:
        "/workspace/test_cv_10_5/AllegroVariantCalling/logs/merge_bam.log"
    conda:
        "/workspace/test_cv_10_5/AllegroVariantCalling/envs/bowtie2_samtools_bcftools.yml"
    shell:
        "samtools merge {output} {input.bams}"
