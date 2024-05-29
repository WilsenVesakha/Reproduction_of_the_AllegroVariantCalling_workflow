rule trim_galore_se:
    input:
        sample="seqs/{sample}.fastq.gz"
    output:
        "intermediates/{sample}_trimmed.fq.gz",
        "intermediates/{sample}.fastq.gz_trimming_report.txt"
    params:
        length = 15,
        stringency = 7,
        clip_R1 = 40
     
    log:
        "logs/trim_galore_{sample}.log",
    conda:
        "../envs/trim_galore.yml"
    shell:
        "trim_galore --length {params.length} --stringency {params.stringency} --clip_R1 {params.clip_R1} {input.sample} -o intermediates"
