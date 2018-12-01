#!/usr/bin/env perl

#This program reads in 80 Arabidopsis genome formatted data
#from the 1000bp upstream of each gene and counts the number of 
#times a given motif occurs in the promoters for each accesion
#Version 1.1 adds the capcity to figure out the orientation of the gene 
#and use that information to appropriately search for motifs

#Authors: Kyle Hernadez and David Lowry

use warnings;
use strict;

my @matrix_array;
my @matrix_rows;
my $counter1;
our %orientation;

#Argument 0 is annotation file
my $file1 = $ARGV[0];
open(MATRIX, $file1) or die $!;

#Read in annotation file
while (<MATRIX>){
	chomp;
	@matrix_rows = split('\t');
	push(@matrix_array, [@matrix_rows]);
	$counter1++;
	}

#Load annotation file into hash that stores 
#gene names as keys and orientation as values
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

my $motif   = $ARGV[2];

# read in file
my $file2   = $ARGV[1];
my $rowct  = 0; 		# Initialize counts
my %curr_hash; 			# Initialize hash; declared globally so that you can work on it in the subroutine without passing it
open (FI, $file2) or die $!;

while (<FI>){
	$rowct++;
	chomp $_;
	my ($gene, $pos, $ref, @values) = split("\t", $_); # Grab the chromosome, position, 
						# reference call, and an array of accession calls
						# this is based on my test file format I have.
	if ($rowct < 1000){ # build the hash of arrays while counts are < 10 (1000 in your case)
		for (my $i=0; $i < $#values; $i++){ # the keys are each column if you need to keep the
						    # Chr and position we can do that too
			push (@{$curr_hash{$i}}, $values[$i]);
		}
	} else {	# When it gets to 10 process this line as before
		for (my $i=0; $i < $#values; $i++){
			push (@{$curr_hash{$i}}, $values[$i]);
		}
		print "$gene\,";
		
		#Determine which subroutine to process hash based on strand orientation
		if ($orientation{$gene} eq "+"){
			&process_hash_plus();
		}elsif($orientation{$gene} eq "-"){
			&process_hash_minus();
		}else{
			next;
		}
		$rowct = 0;	# re-initialize
		undef %curr_hash; #re-initialize
	}
}
close(FI);
exit;


# This is where you would write what you want to do with the columns
sub process_hash_plus {
	# General processing of the hash of arrays
	# Perl uses referenced crap when dealing with hashes of array
	# so you will see me use "@{$" to dereference it.
	# Loop through the hash keys sorted
	
	foreach my $i ( sort{ $a<=>$b} keys %curr_hash) {
	
		# make the current column a string
		my $curr_column = join("",@{$curr_hash{$i}});
		#print "Forward:$curr_column\n";
		# some simple regex here
		my $count1 =()= $curr_column =~ /$motif/gi;
		#print "$curr_column\n";
		print "$count1\,";
	}
	print "\n";
}

sub process_hash_minus {
	# General processing of the hash of arrays
	# Perl uses referenced crap when dealing with hashes of array
	# so you will see me use "@{$" to dereference it.
	# Loop through the hash keys sorted
	
	foreach my $i ( sort{ $a<=>$b} keys %curr_hash) {
	
		# make the current column a string
		my $curr_column = join("",@{$curr_hash{$i}});
		#print "Forward:$curr_column\n";
		my $curr_column1 = reverse $curr_column;
		$curr_column1 =~ tr/ACGT/TGCA/;
		#print "Reverse$curr_column1\n";
		# some simple regex here
			my $count1 =()= $curr_column1 =~ /$motif/gi;
			#print "$curr_column1\n";
			print "$count1\,";
	}
	print "\n";
}
