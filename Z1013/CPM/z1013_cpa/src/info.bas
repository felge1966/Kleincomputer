'cls
print "*** BIOS - INFO  V.Pohlers 2017 ***":print

bios = deek(1)-3
print "BDOS = ", hex$(deek(6),4)
print "BIOS = ", hex$(bios,4)

print

'Kennung hinter BIOS-Sprungleiste abfragen
cpa$ = ""
for i=bios + &h33 to bios + &h33 + 4 
  cpa$ = cpa$ + chr$(peek(i))
next i
if cpa$ <> "CPA13" then print "Kein Z1013-CP/A":end


'--------------------------------------------------------
config = bios + &h38

'0 console
c = peek(config+0)
print "CON = ";
if c = 0 then
  print "32x32 original"
elseif c = 1 then
  print "64x16 Peters-Platine"
elseif c = 2 then
  print "64x32 H.P. K1520-BWS"
else
  print c
endif

'1 rdr
c = peek(config+1)
print "RDR = ";c

'2 pun
c = peek(config+2)
print "PUN = ";c

'3 list
c = peek(config+3)
print "LST = ";
if c = 0 then
  print "Sprungverteiler"
elseif c = 1 then
  print "V24-Riesa-Modul 9600 Baud"
else
  print c
endif

print

'4 anzlw
c = peek(config+4)
print c;" Laufwerke"
for i = 1 to c
  lw=peek(config+4+i)
  print chr$('A'+i-1),": ";
  if lw = 16 then
    print "Floppy-Disk 3,5/5",chr$(34),"(80,DS)"
  else
    print lw
  endif
next i

end
