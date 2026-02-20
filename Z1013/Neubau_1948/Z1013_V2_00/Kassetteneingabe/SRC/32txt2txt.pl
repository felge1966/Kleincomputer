# F83 to Text
# $Id$
# $Log:$

open IN, "<$ARGV[0]" or die "Aufruf: $0 textdatei.z80 [zeilenbreite]\n";
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

$b = 32 || $ARGV[1];

while ($pos < length $text) {
	$zeile = substr($text,$pos,$b); $pos += $b;
	$zeile =~ s/\s+$//;
	printf OUT "$zeile\n";
}
close OUT;
