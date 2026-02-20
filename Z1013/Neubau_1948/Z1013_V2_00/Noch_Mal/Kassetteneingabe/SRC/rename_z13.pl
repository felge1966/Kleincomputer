#!/usr/local/bin/perl
# Umbenennen von Z1013-z13-Dateien, die z.B. mit KCLOAD-AUTO eingelesen wurden
# alle *.z13-Dateien im aktuellen Verzeichnis werden bearbeitet
# Doubletten werden gelöscht
# V.Pohlers, 30.10.2011

use Digest::MD5 qw(md5_hex);

our $filename;
our $type;
our $chksum;

our %files; # index über chksum

## Main ##########

while (<*.z13>) {
	my $file=$_;
	
	print"$file ";
	
	# analysiere Datei
	$filename = '';
	scan_tap($file);

	#12.01.2013
	($filename) = $file =~ /(.*).z13/i unless $type;
	
	unless ($filename) {
		print " ... nicht gescannt!";
	}
	# Datei schon mal gehabt? (anhand Prüfsumme)
	elsif (exists $files{$chksum}) {
		print " ... doppelte Datei";
		unlink $file;
	} else {
		# gleicher Filename?
		if ($file ne "$filename.z13") {
			my $newfile;
			# gibt es File schon? Dann hochzählen ...
			if (-e "$filename.z13") {
				my ($cnt) = $file =~ /^(.+)\.z13/i;
				$newfile = "$filename ($cnt).z13";
			} else {
				$newfile = "$filename.z13";
			}
			print " --> $newfile";		
			rename $file, $newfile;
		}
	}

	$files{$chksum} = 1;	# chksum merken
	print "\n";
}


## UPs ########

sub scan_tap {
	my $name,$typ, $aadr, $eadr, $sadr;
	$type = '';
	
	open IN, "<".shift;
	binmode IN;

	# Header lesen
	read IN, $block, 0x20; 
	#close IN;
	
#KOPFAUFBAU: Byte 0-1 Anfangsadresse 
#               2-3   Endadresse
#               4-5   Startadresse
#               6-0BH frei fuer Zusatzinformationen
#                 0CH Typkennzeichen
#             0DH-0FH 3 x 0D3H = Kopfkenzeichen
#                     (An diesem D3 erkennt jedes Kopfsuchpro-
#                      gramm einen Kopf !!)
#             10H-1FH 16 Byte Namensblock.
             
	# Z1013-Headersave-Header
	($aadr, $eadr, $sadr, $extra ,$typ, $kennung, $name) = unpack("
		SSS		   # aadr, eadr, sadr: word;
		a6		   # frei fuer Zusatzinformationen
		a1                 # Typkennzeichen
		a3                 # Kopfkennzeichen 3x 0xD3
		a16                # dateiname
		", $block 
	);

	$name =~ s/[\x00\x08*]//g;	# 00 und * löschen
	$name =~ s/[\\\/:<>]/_/g;	# Sonderzeichen \ / : >
	$name =~ s/\s+$//g;		# Leerzeichen am Ende löschen

	printf "%s %s %04x-%04x,%04x",$name,$typ,$aadr,$eadr,$sadr;

	# MD5-Summe ab 2. Block
	read IN, $data, 65000;	# sollte reichen ;-)
	close IN;
	
	$filename = $name;
	
	$type = 'b' if ($name ge '@' and $aadr == 0x1000);
	
	$chksum = md5_hex($data);
}
