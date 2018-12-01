#!/usr/bin/perl

#This program uses the TAIR10 annotation information
#to figure out the orientation of genes.
#I wrote the program as a stand alone 
#that will be merged with Motif_finder.pl
#to search for motifs in the correct orientation.
#Motif_finder.pl is located in the 1000bp_upstream directory.

use warnings;
use strict;

my @matrix_array;
my @matrix_rows;
my $counter1;
my %orientation;

#Argument 2 is annotation file
my $file = $ARGV[0];
open(MATRIX, $file) or die;


while (<MATRIX>){
	chomp;
	@matrix_rows = split('\t');
	push(@matrix_array, [@matrix_rows]);
	$counter1++;
	}
	
for (my $y=0; $y < $counter1; ++$y){
	if("$matrix_array[$y][2]" eq "gene" && "$matrix_array[$y][6]" eq "+"){
		my $gene = "$matrix_array[$y][9]";
		$orientation{$gene} = "+";
	}elsif("$matrix_array[$y][2]" eq "gene" && "$matrix_array[$y][6]" eq "-"){
		my $gene = "$matrix_array[$y][9]";
		$orientation{$gene} = "-";
	}else{
 		next;
 	}
}

my $test = $orientation{'AT1G01020'};
print "$test\n";
