#!/usr/bin/perl

#DRE
system("perl Motiff_finder1.2.pl TAIR10_GFF3_genes_mod.gff.cr 80_genomes_promoter_all.txt GCCGAC > GCCGAC_CAGCCG_DRE_F_R_all.csv");#Both directions
system("perl Motiff_finder1.2.pl TAIR10_GFF3_genes_mod.gff.cr 80_genomes_promoter_all.txt AGCCGAC > AGCCGAC_CAGCCGA_DRE_F_R_all.csv");#Both directions
system("perl Motiff_finder1.2.pl TAIR10_GFF3_genes_mod.gff.cr 80_genomes_promoter_all.txt GGCCGAC > GGCCGAC_CAGCCGG_DRE_F_R_all.csv");#Both directions
