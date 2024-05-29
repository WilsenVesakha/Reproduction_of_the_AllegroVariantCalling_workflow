rule filter_variants:
    input:
        variants="/workspace/test_cv_10_5/AllegroVariantCalling/merged_target_file_false.vcf"
    output:
        filt="merged.filt.vcf"
    log:
        "/workspace/test_cv_10_5/AllegroVariantCalling/logs/filter_variants.log"
    params:
        gq_score ="FMT/GQ<20"
    conda:
        "/workspace/test_cv_10_5/AllegroVariantCalling/envs/bowtie2_samtools_bcftools.yml"
    shell:
        "bcftools filter -S . -e '{params.gq_score}' {input} -o {output}"
