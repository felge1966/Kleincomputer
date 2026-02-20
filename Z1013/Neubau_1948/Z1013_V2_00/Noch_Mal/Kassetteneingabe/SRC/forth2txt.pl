# F83 to Text
# $Id$
# $Log:$

open IN, "<$ARGV[0]" or die "Aufruf: $0 forthdatei.z80\n";
binmode IN;
read IN, $_, 32;	# Header überlesen

# Datei einlesen
undef $\;
while (<IN>) {
	$text .= $_;
}
close IN;

($OUT = $ARGV[0]) =~ s/z80/txt/i;
print "$OUT ";
open OUT, ">$OUT";

$pos = 0;
$screen = 1;
$nr = 16;

while ($pos < length $text) {
	if ($nr == 16) {
		print OUT "\n" if $screen > 1;
		printf OUT "Screen # %.2d -----------------------\n\n", $screen;
		$nr = 0;
		$screen++;
	}	
	$zeile = substr($text,$pos,32); $pos += 32;
	$zeile =~ s/\s+$//;
	printf OUT "%.2d %s\n", $nr, $zeile;
	$nr++; 
}
close OUT;
