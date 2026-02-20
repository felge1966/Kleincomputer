# F83 to Text
# $Id$
# $Log:$

open IN, "<$ARGV[0]" or die "Aufruf: z802txt.pl datei.z80 [-u]\n";
binmode IN;

read IN, $_, 32;	# Header überlesen

# Datei einlesen
undef $\;
while (<IN>) {
	$text .= $_;
}
#$_ = <IN>;
close IN;

$_ = $text;

#7.Bit löschen
s/(.)/($1 & chr(0x7f))/gmsxe;

s/\x0d\x0a/\n/gms;

#Nach Stop ist Text zu Ende
s/\x1A.*$//gms;

#durchgestrichene Null
s/0\x08\//0/gms;

#Zeichenersetzung
# 1f-Trennung, 02,13-Fettdruck
tr/\x1f\x02\x13\x1e\x00\x17\x05\x06/-/d;

#print;

# kovtertierten Text ausgeben
($OUT = $ARGV[0]) =~ s/DOC/TXT/ig;
print "$OUT ";
open OUT, ">$OUT";
print OUT;
close OUT;

