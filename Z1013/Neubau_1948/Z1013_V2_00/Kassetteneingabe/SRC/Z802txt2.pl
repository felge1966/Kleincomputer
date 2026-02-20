# F83 to Text
# $Id$
# $Log:$

open IN, "<$ARGV[0]" or die "Aufruf: z802txt.pl datei.z80 [-u]\n";
binmode IN;
read IN, $_, 32;	# Header überlesen

#TODO:

#Header einlesen:
#filetyp (z80, z13)
#aadr,eadr,sadr,füllbytes,typ,name


# Test auf ((z80 und Typ b) oder z13) und aadr 1000h -> Tiny-Basic-Programm
# Test auf z80 und Typ B -> HC-Basic-Programm
# diese speziell behandeln

# Datei einlesen
undef $\;
while (<IN>) {
	$text .= $_;
}
#$_ = <IN>;
close IN;

$_ = $text;

#Zeichenersetzung
#1E-Zeilenende, 1C-Beginn Fettdruck, 1D-Ende Fettdruck
tr/\x1E\x1C\x1D/\n/;

#Umlaute
#wird ein zweites Argument angegeben (z.B. -u), erfolgt Umlautwandlung
$umlaut=1 if /f}r/;
$umlaut=0 if /fuer/;
$umlaut=1 if $ARGV[1];

tr/\[\\\]{\|}~/ÄÖÜäöüß/ if $umlaut;

#Nach Stop ist Text zu Ende
s/\x03.*$//gms;

# kovtertierten Text ausgeben
($OUT = $ARGV[0]) =~ s/z80|z13/txt/ig;
print "$OUT ";
open OUT, ">$OUT";
print OUT;
close OUT;
