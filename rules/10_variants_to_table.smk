rule variants_to_table:
	input:
		filt="/workspace/test_cv_10_5/AllegroVariantCalling/merged_target_file_false.filt.vcf"
	output:
		depths="merged.depths.table",
		genotypes="merged.genotypes.table"
	log:
		"AllegroVariantCalling/logs/gatk_variants_to_table.log"
	conda:
		"/workspace/test_cv_10_5/AllegroVariantCalling/envs/gatk.yml"
	shell:
		"gatk VariantsToTable -V {input} -F CHROM -F POS -F REF -F ALT -GF DP -O {output.depths} && \
		gatk VariantsToTable -V {input} -F CHROM -F POS -F REF -F ALOT -GF GT -O {output.genotypes}"
