config_targets_file = False
rule call_variants:
    input:
        mpileup="/workspace/test_cv_10_5/AllegroVariantCalling/merged_target_file_false.mpileup"
    output:
        
        "merged.vcf"

    params:
        t="-t /workspace/test_cv_10_5/AllegroVariantCalling/targets.tsv" if config_targets_file else ""
    log:
        "/workspace/test_cv_10_5/AllegroVariantCalling/logs/call_variants.log"
    conda:
        "/workspace/test_cv_10_5/AllegroVariantCalling/envs/bowtie2_samtools_bcftools.yml"
    shell:
        "bcftools call {input.mpileup} -v -f GQ {params.t} -O v -m > {output}"
