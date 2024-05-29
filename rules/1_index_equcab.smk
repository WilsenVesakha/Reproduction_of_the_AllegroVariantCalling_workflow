BT2_EXT = [".1.bt2", ".2.bt2", ".3.bt2", ".4.bt2", ".rev.1.bt2", ".rev.2.bt2"]

rule index_equcab:
    input:
        "genome.fa",
    output:
        expand("genome{ref_ext}", ref_ext=BT2_EXT)
    log:
        "logs/index_equcab.log"
    conda:
        "../envs/bowtie2_samtools_bcftools.yml"
    shell:
        "bowtie2-build genome.fa genome"
