# Umbau RAF2014 auf RAF512

Basis ist die RAF2014 von SRN

Dafür standen mir die Gerberdaten zur Verfügung

## Schritte für RAM-Änderung

- Adressierung von 6c4008 auf 628128

   - Trennen TS12 (U14-Pin 1) nach RNW (Die Widerstände R9 und R10 müssen am Decoder bleiben)
   - Trennen TS13 (U14-Pin 2) nach RNW (Die Widerstände R9 und R10 müssen am Decoder bleiben)
   - Trennen TS10 der RAMs unter RAM U3
   - Verbinden Pin 30 der RAMs über 5K1 Wid mit Pin 32 (+5PS)

- Neue Decodierung

   - U14 (Pin 1) mit U12 (Pin 17) verbinden
   - U14 (Pin 2) mit U12 (Pin 16) verbinden

- Anpassung Trackregister

   - U12 (Pin 13) ADV (org) trennen
   - U12 (Pin 15) ADV (neu) mit U13 (Pin 8) verbinden


## Kapazität
  
>     ADV an ABx	ADV an U12 Pin	    Umfang RAF
>     AB12	        15	                512K
>     AB13	        14	                1024K
>     AB14	        13	                2048K

Mittels Port AX wird auf die zweite Hälfte bei einer RAF2008 umgeschaltet

## Jumper

>     Adresse	    8xh/2xh	    0/1
>     Port20h	    geschlossen offen  
>     Port24h	    geschlossen geschlossen 
>     Port88h	    offen       offen      
>     Port8Ch	    offen       geschlossen
