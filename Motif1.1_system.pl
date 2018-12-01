#!/usr/bin/perl

#ABRE
system("perl Motiff_finder1.1.pl TAIR10_GFF3_genes_mod.gff.cr 80_genomes_promoter_all.txt ACGT > ACGT_ABRE_core_all.csv");
system("perl Motiff_finder1.1.pl TAIR10_GFF3_genes_mod.gff.cr 80_genomes_promoter_all.txt ACGTG > ACGTG_ABRE_all.csv");
system("perl Motiff_finder1.1.pl TAIR10_GFF3_genes_mod.gff.cr 80_genomes_promoter_all.txt ACGTGG > ACGTGG_ABRE_all.csv");
system("perl Motiff_finder1.1.pl TAIR10_GFF3_genes_mod.gff.cr 80_genomes_promoter_all.txt ACGTGT > ACGTGT_ABRE_all.csv");

#Long ABRE
system("perl Motiff_finder1.1.pl TAIR10_GFF3_genes_mod.gff.cr 80_genomes_promoter_all.txt ACACGTGG > ACACGTGG_ABRE_all.csv");
system("perl Motiff_finder1.1.pl TAIR10_GFF3_genes_mod.gff.cr 80_genomes_promoter_all.txt CCACGTGG > CCACGTGG_ABRE_all.csv");

#Gbox
system("perl Motiff_finder1.1.pl TAIR10_GFF3_genes_mod.gff.cr 80_genomes_promoter_all.txt CACGTG > CACGTG_ABRE_Gbox_all.csv");

#T/Gbox
system("perl Motiff_finder1.1.pl TAIR10_GFF3_genes_mod.gff.cr 80_genomes_promoter_all.txt CACGTT > CACGTT_ABRE_TGbox_all.csv");

#DRE
system("perl Motiff_finder1.1.pl TAIR10_GFF3_genes_mod.gff.cr 80_genomes_promoter_all.txt GCCGAC > GCCGAC_DRE_F_all.csv");#Forward
system("perl Motiff_finder1.1.pl TAIR10_GFF3_genes_mod.gff.cr 80_genomes_promoter_all.txt CAGCCG > CAGCCG_DRE_R_all.csv");#Reverse
system("perl Motiff_finder1.1.pl TAIR10_GFF3_genes_mod.gff.cr 80_genomes_promoter_all.txt AGCCGAC > AGCCGAC_DRE_F_all.csv");#Forward
system("perl Motiff_finder1.1.pl TAIR10_GFF3_genes_mod.gff.cr 80_genomes_promoter_all.txt CAGCCGA > CAGCCGA_DRE_R_all.csv");#Reverse
system("perl Motiff_finder1.1.pl TAIR10_GFF3_genes_mod.gff.cr 80_genomes_promoter_all.txt GGCCGAC > GGCCGAC_DRE_F_all.csv");#Forward
system("perl Motiff_finder1.1.pl TAIR10_GFF3_genes_mod.gff.cr 80_genomes_promoter_all.txt CAGCCGG > CAGCCGG_DRE_R_all.csv");#Reverse
