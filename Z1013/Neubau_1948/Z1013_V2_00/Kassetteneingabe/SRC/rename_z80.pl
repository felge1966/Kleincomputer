#!/usr/local/bin/perl
# Umbenennen von Z1013-Z80-Dateien, die z.B. mit KCLOAD-AUTO eingelesen wurden
# alle *.z80-Dateien im aktuellen Verzeichnis werden bearbeitet
# Doubletten werden gelöscht
# V.Pohlers, 30.10.2011

use Digest::MD5 qw(md5_hex);

our $filename;
our $chksum;

our %files; # index über chksum

## Main ##########

while (<*.Z80>) {
	my $file=$_;
	
	print"$file ";
	
	# analysiere Datei
	$filename = '';
	scan_tap($file);
	unless ($filename) {
		print " ... nicht gescannt!";
	}
	# Datei schon mal gehabt? (anhand Prüfsumme)
	elsif (exists $files{$chksum}) {
		print " ... doppelte Datei";
		unlink $file;
	} else {
		# gleicher Filename?
		if ($file ne "$filename.z80") {
			my $newfile;
			# gibt es Fiel schon? Dann hochzählen ...
			if (-e "$filename.z80") {
				my ($cnt) = $file =~ /^(.+)\.z80/i;
				$newfile = "$filename ($cnt).z80";
			} else {
				$newfile = "$filename.z80";
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
	my $type;
	
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

	if ($kennung eq "\x00\x00\x00" and $typ eq "\x00") { # Kopfkennzeichen stimmt nicht
		$typ = 'b';
		print "Tiny-Basic orig";
	}
	elsif ($kennung ne "\xd3\xd3\xd3") { # Kopfkennzeichen stimmt nicht
		close IN;
		return;
	}

	$name =~ s/[\x00\x08*]//g;	# 00 und * löschen
	$name =~ s/[\\\/:<>]/_/g;	# Sonderzeichen \ / : >
	$name =~ s/\s+$//g;		# Leerzeichen am Ende löschen

	printf "%s %s %04x-%04x,%04x",$name,$typ,$aadr,$eadr,$sadr;

	# MD5-Summe ab 2. Block
	read IN, $data, 65000;	# sollte reichen ;-)
	close IN;
	
	$filename = "$typ.$name";
	$chksum = md5_hex($data);
}
