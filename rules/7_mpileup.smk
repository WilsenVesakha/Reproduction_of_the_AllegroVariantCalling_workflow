config_targets_file = False
rule mpileup:
    input:
        bam="/workspace/test_cv_10_5/AllegroVariantCalling/merged.bam",
        reference="/workspace/test_cv_10_5/AllegroVariantCalling/genome.fa"
    output:
        "merged.mpileup"

    params:
        t="--targets-file /workspace/test_cv_10_5/AllegroVariantCalling/targets.tsv" if config_targets_file else ""
    log:
        "/workspace/test_cv_10_5/AllegroVariantCalling/logs/mpileup.log"
    conda:
        "/workspace/test_cv_10_5/AllegroVariantCalling/envs/bowtie2_samtools_bcftools.yml"
    shell:
        #" bcftools mpileup -d1000000 -Ob /workspace/test_cv_10_5/AllegroVariantCalling/merged.bam "
        ##"--fasta-ref {input.reference} -a FORMAT/DP "
        #"{params.t} -o merged.mpileup "
        #"bcftools mpileup -d1000000 --skip-indels -Ob {input.bam} --fasta-ref {input.reference} -a FORMAT/DP {params.t} -o {output}"
        "bcftools mpileup -d1000000 -Ob {input.bam} --fasta-ref {input.reference} -a FORMAT/DP {params.t} -o {output}"

#bcftools mpileup -d1000000 --skip-indels -Ov merged.bam \
#    --fasta-ref $FASTA_REFERENCE -a FORMAT/DP \
#    --targets-file targets.tsv.gz -o merged.mpileup 