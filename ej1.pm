#!/usr/bin/perl -w

## Uso:
## Correr el script pasandole como primer parametro el archivo NM de entrada y
## como segundo parametro donde se escribira la salida.
##
## Ej: ./ej1.pm NM003466.gb rta1

use Bio::SeqIO;

$inFile = $ARGV[0];
$outFile = $ARGV[1];

$in = Bio::SeqIO->new(-file => "$inFile",
                      -format => 'Genbank');

$out1 = Bio::SeqIO->newFh(-file => ">$outFile" . "_RF1.fas", -format => 'Fasta');
$out2 = Bio::SeqIO->newFh(-file => ">$outFile" . "_RF2.fas", -format => 'Fasta');
$out3 = Bio::SeqIO->newFh(-file => ">$outFile" . "_RF3.fas", -format => 'Fasta');
$out4 = Bio::SeqIO->newFh(-file => ">$outFile" . "_RF1R.fas", -format => 'Fasta');
$out5 = Bio::SeqIO->newFh(-file => ">$outFile" . "_RF2R.fas", -format => 'Fasta');
$out6 = Bio::SeqIO->newFh(-file => ">$outFile" . "_RF3R.fas", -format => 'Fasta');

while (my $seq = $in->next_seq) {
  print $out1 $seq->translate(-frame => 0);
  print $out2 $seq->translate(-frame => 1);
  print $out3 $seq->translate(-frame => 2);
  print $out4 $seq->revcom->translate(-frame => 0);
  print $out5 $seq->revcom->translate(-frame => 1);
  print $out6 $seq->revcom->translate(-frame => 2);
}
