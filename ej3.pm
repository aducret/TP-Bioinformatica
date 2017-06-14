# We used the following URL for reference: http://www.bioinfopoint.com/index.php/code/3-multiple-sequence-alignment-with-bioperl-and-muscle

use Getopt::Long;
use Bio::Tools::Run::Alignment::Muscle;
use Bio::SimpleAlign;
use Bio::AlignIO;
use Bio::SeqIO;
use strict;

# Read parameters
# File with multiple Fasta sequences
my $source_file = $ARGV[0];
# Output file
my $target_file = $ARGV[1];

# Limit MUSCLE parameters to 4GB and 100 iterations
my @params = (quiet => 0, maxmb => '4000', maxiters => '100');
 
# Create the factory
my $factory = Bio::Tools::Run::Alignment::Muscle->new(@params);

# Load source fasta file
my $str = Bio::SeqIO->new(-file=> $source_file, '-format' => 'Fasta');

# Setup output file 
my $out = Bio::AlignIO->new(-file   => ">".$target_file, -format => 'clustalw');

# Creates an array with all sequences to be alignment
my @protseq_array =();
 
while ( my $seq = $str->next_seq() ) {
    push (@protseq_array, $seq);
 
    print "Added sequence ".$seq->id." to the array\n";
}
 
# Align the sequences
my $aln = $factory->align(\@protseq_array);

# Write results to output file
$out->write_aln($aln);
