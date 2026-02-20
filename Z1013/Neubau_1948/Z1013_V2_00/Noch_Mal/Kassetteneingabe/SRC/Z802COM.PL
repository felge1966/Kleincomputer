# F83 to Text
# $Id$
# $Log:$

open IN, "<$ARGV[0]" or die "Aufruf: z802com.pl datei.z80\n";
binmode IN;
read IN, $_, 32;	# Header überlesen

($OUT = $ARGV[0]) =~ s/.Z80//ig;
print "$OUT ";
open OUT, ">$OUT";
binmode OUT;

# Datei einlesen
undef $\;
while (<IN>) {
	print OUT;
}
close IN;
close OUT;
