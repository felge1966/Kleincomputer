#***************************************************************************************************
#*  Load und Save von Programmen fuer Mikrorechnerbausatz Z1013 von und auf eine SD Karte          *
#*                                                                                                 *
#*  Ersteller Jens Dietrich (www.icplan.de)                                                        *
#*  Raspberry PI Pico, Pico W with RP2040                                                          *
#*  Micropython V1.24.0                                                                            *
#*  letzte Aenderung 16.01.2025                                                                    *
#*  Softwareversion V0.99.00                                                                       *
#*                                                                                                 *
#*  MicroSD VCC  pin to Pico 3,3Volt (36)                                                          *
#*  MicroSD GND  pin to Pico GND     (38)                                                          *
#*  MicroSD SCK  pin to Pico GPIO-10 (14)                                                          *
#*  MicroSD MOSI pin to Pico GPIO-11 (15)                                                          *
#*  MicroSD MISO pin to Pico GPIO-12 (16)                                                          *
#*  MicroSD CS   pin to Pico GPIO-13 (17)                                                          *
#*                                                                                                 *
#*  UART1 TX     pi PICO GPIO-8      (11)                                                          *
#*  UART1 RX     pi PICO GPIO-9      (12)                                                          *
#***************************************************************************************************

from machine import UART, Pin, SPI, Timer
import sdcard, os, time

uart1 = UART(1, baudrate=19200, tx=Pin(8), rx=Pin(9), rxbuf=2000)                        # serielle schnittstelle initialisieren
led = machine.Pin(25,machine.Pin.OUT)

def filter_txt_dateien(datei):
    return datei.lower().endswith('.z80') and datei[0].isalpha() or datei[0].isdigit()   # filter auf ersten buchstaben / zahl

def filter_txt_dateien_bst(datei, buchstabe):                                            # filter alle dateien mit z80 endung
    return datei.lower().endswith('.z80') and datei[0].lower() == buchstabe.lower()

def load():
    global liste_r, liste_len                                                            # globale nutzung
    time.sleep(1)

    try:
        os.umount('/sd')                                                                 # damit kann man die sd karte im betrieb umstecken
    except Exception as e:
        print("Fehler:", e)
    try:
        sd=sdcard.SDCard(spi,Pin(13))
        vfs=os.VfsFat(sd)
        os.mount(sd,'/sd')
#        print(os.listdir('/sd'))                                                        # inhalt der sd karte anzeigen
    except Exception as e:
        print("Fehler:", e)
        return                                                                           # sd karte fehlt !
    
    sd=sdcard.SDCard(spi,Pin(13))
    vfs=os.VfsFat(sd)

    anz = bytes(0)
    anz = anz + "Z80 Datei von SD Karte lesen    "
    anz = anz + "als Dateiname einen Buchstaben  "
    anz = anz + "oder Enter fuer alle :          "
    anz = anz + "--------------------------------"
    uart1.write(anz)
    
    anzahl = uart1.any()                                                                 # antwort = taste vom z1013 einlesen
    while(True):
        anzahl = uart1.any()
        if(anzahl>0):
            t = uart1.read(1)
            time.sleep_ms(100)
            break
    
    liste_r = os.listdir('/sd')
    if(t == b'\r'):                                                                      # mit enter am z1013 alle dateien anzeigen
        liste_r = sorted(filter(filter_txt_dateien, liste_r))
    else:                                                                                # nur ausgewaehlte (zahl oder buchstabe) datei anzeigen
        buchstabe = t.decode("utf-8")
        liste_r = sorted(filter(lambda datei: filter_txt_dateien_bst(datei, buchstabe), liste_r))
    
    liste_len = len(liste_r)
    liste_start = 0                                                                      # start index
    
    while(True):
        x = load_next(liste_start)
        if(x==0)or(x<100):                                                               # bei index auswahl 0-99
            break
        if(x==101):                                                                      # bei auswahl ende = 101
            break
        if(x==100):                                                                      # bei taste enter = 100
            time.sleep_ms(500)
            if((liste_start+20)<liste_len):
                liste_start = liste_start + 20
                   
    if(x==101):
        print('Abbruch Auswahl mit E')
        return

    if(x + 1) > liste_len:                                                               # wahl war zu hoch
        return
    print(liste_r[x])                                                                    # zur kontrolle dateinamen ausgeben
    load_z80datei(liste_r[x])                                                            # jetzt die gewaehlte datei laden

def load_next(start):
    global liste_r, liste_len                                                            # globale nutzung
    anz = bytes(0)
    y = 0
    
    ende = start + 20

    if(ende>liste_len):
        ende = liste_len
    
    for x in range(start,ende):
        dn = (liste_r[x])[:27]
        anz = anz + "{0:02d} - {1:<27}".format(x,dn)                                     # eintraege anzeigen 
        y = y + 1
    
    for x in range(start,start+20-y):
        anz = anz + "{0:02d} -                            ".format(x+y)
    
    anz = anz + "--------------------------------"
    anz = anz + "waehlen:    / ENTER fuer weiter "                                       # mit e kann abgebrochen werden
    uart1.write(anz)    
    
    while(True):
        anzahl = uart1.any()
        if(anzahl>0):
            zahl1 = uart1.read(1)                                                        # erste tastatur eingabe am z1013
            break
    
    if(zahl1 == b'\r'):                                                                  # bei enter zahl 100 zurueckgeben
        wahl = int(100)
        print('Enter gedrueckt !!!')
        return wahl
    if(zahl1 == b'E'):                                                                   # bei e = ende zahl 101 zurueckgeben
        wahl = int(101)
        print('Ende gedrueckt !!!')
        return wahl
    
    while(True):
        anzahl = uart1.any()
        if(anzahl>0):
            zahl2 = uart1.read(1)                                                        # zweite tastatur eingabe am z1013
            break

    if(zahl2 == b'\r'):                                                                  # bei enter zahl 100 zurueckgeben
        wahl = int(100)
        print('Enter gedrueckt !!!')
        return wahl
    if(zahl2 == b'E'):                                                                   # bei e = ende zahl 101 zurueckgeben
        wahl = int(101)
        print('Ende gedrueckt !!!')
        return wahl

    wahl = int((10*(int(zahl1)))+(int(zahl2)))                                           # auswahl / index berechnen
    return wahl                                                                          # auswahlindex zurueckgeben

def load_z80datei(dateiname):
    time.sleep(1)

    name = "/sd/" + dateiname
    file = open(name, "rb")
    read_data = file.read()
    lend = len(read_data)
    
    zeile1 = ""                                                                          # obere anzeigezeile erstellen

    beg = (read_data[1]*256) + read_data[0]                                              # ram beginn
    end = (read_data[3]*256) + read_data[2]                                              # ram ende
    sta = (read_data[5]*256) + read_data[4]                                              # startadresse
    zeile1 = "%04X-%04X %04X" % (beg,end,sta) + ' >'

    for x in range(16,32):
        inh = read_data[x]
        if(inh > 0x80): inh = 0x20                                                       # keine zeichen ueber 0x80 zulassen
        zeile1 = zeile1 + chr(inh)

    for x in range(0,len(zeile1)):
        uart1.write(zeile1[x])                                                           # erste zeile senden
        time.sleep_ms(10)

    pro_len = lend-32                                                                    # programmlaenge ohne heyderbytes
    pro_lenh = int((pro_len) / 256)                                                      # high byte
    pro_lenl = (pro_len) - (pro_lenh * 256)                                              # low byte

    zeile2 = "%04X BYTE                       " % (pro_len)                              # zweite zeile    
    for x in range(0,len(zeile2)):
        uart1.write(zeile2[x])                                                           # zweite zeile senden
        time.sleep_ms(10)
        
    s_daten = []                                                                         # steuerdaten fuer datentransfer senden
    s_daten.append(read_data[1])                                                         # ram beginn high
    s_daten.append(read_data[0])                                                         # ram beginn low
    s_daten.append(pro_lenh)                                                             # high programmlaenge
    s_daten.append(pro_lenl)                                                             # low programmlaenge
    uart1.write(bytes(s_daten))                                                          # 4 steuerbytes senden

    for x in range(32,lend):                                                             # programmbytes auf sd karte schreiben
        uart1.write((int(read_data[x])).to_bytes())
        time.sleep_us(500)

    print('LOAD ok')
    file.close()

def load_datei():
    time.sleep(1)
    try:
        os.umount('/sd')                                                                 # damit kann man die sd karte im betrieb umstecken
    except Exception as e:
        print("Fehler:", e)

    try:
        sd=sdcard.SDCard(spi,Pin(13))
        vfs=os.VfsFat(sd)
        os.mount(sd,'/sd')
        print(os.listdir('/sd'))
    except Exception as e:
        print("Fehler:", e)
        return                                                                           # sd karte fehlt !
    
    file = open("/sd/datei.z80", "rb")                                                   # universelle datei laden
    read_data = file.read()
    lend = len(read_data)
    
    zeile1 = ""                                                                          # obere anzeigezeile erstellen

    beg = (read_data[1]*256) + read_data[0]                                              # ram beginn
    end = (read_data[3]*256) + read_data[2]                                              # ram ende
    sta = (read_data[5]*256) + read_data[4]                                              # startadresse
    zeile1 = "%04X-%04X %04X" % (beg,end,sta) + ' >'

    for x in range(16,32):
        inh = read_data[x]
        if(inh > 0x80): inh = 0x20                                                       # keine zeichen ueber 0x80 zulassen
        zeile1 = zeile1 + chr(inh)

    for x in range(0,len(zeile1)):
        uart1.write(zeile1[x])                                                           # erste zeile senden
        time.sleep_ms(10)

    pro_len = lend-32                                                                    # programmlaenge ohne heyderbytes
    pro_lenh = int((pro_len) / 256)                                                      # high byte
    pro_lenl = (pro_len) - (pro_lenh * 256)                                              # low byte

    zeile2 = "%04X BYTE                       " % (pro_len)                               # zweite zeile    
    for x in range(0,len(zeile2)):
        uart1.write(zeile2[x])                                                           # zweite zeile senden
        time.sleep_ms(10)
        
    s_daten = []                                                                         # steuerdaten fuer datentransfer senden
    s_daten.append(read_data[1])                                                         # ram beginn high
    s_daten.append(read_data[0])                                                         # ram beginn low
    s_daten.append(pro_lenh)                                                             # high programmlaenge
    s_daten.append(pro_lenl)                                                             # low programmlaenge
    uart1.write(bytes(s_daten))                                                          # 4 steuerbytes senden

    for x in range(32,lend):                                                             # programmbytes auf sd karte schreiben
        uart1.write((int(read_data[x])).to_bytes())
        time.sleep_us(500)

    print('LOAD ok')
    file.close()

def save_datei():
    anzahl = 0
    while(True):                                                                         # warten auf zweites byte vom z1013
        if(uart1.any()):
            break
    text = bytes(0) 
    while(True):
        time.sleep_ms(50)                                                                # wenn 50ms nix mehr ankommt = ende empfang
        neu = uart1.any()
        if(neu == anzahl):
            break
        text = text + uart1.read()
        neu = 0
    
    datei = []                                                                           # dateiinhalt
    name = '/sd/'                                                                        # pfad und dateiname
    for x in range(6):                                                                   # 6 bytes header programm (beginn,ende,start)
        datei.append(text[x])
    for x in range(6):                                                                   # 6 mal 0x00 anhängen
        datei.append(0x00)
    datei.append(0x43)
    datei.append(0xd3)
    datei.append(0xd3)
    datei.append(0xd3)
    for x in range(6,22):                                                                # header 0x10-0x1f zusammenstellen - programmname
        datei.append(text[x])
        name = name + chr(text[x])
        
    try:
        os.umount('/sd')                                                                 # damit kann man die sd karte im betrieb umstecken
    except Exception as e:
        print("Fehler:", e)

    sd=sdcard.SDCard(spi,Pin(13))
    vfs=os.VfsFat(sd)
    os.mount(sd,'/sd')
    name = name + '.Z80'                                                                 # dateiendung z80 anhaengen
    file = open(name,"w")

    file.write(bytes(datei))                                                             # header auf sd karte schreiben
    for x in range(22,len(text)):                                                        # programmbytes auf sd karte schreiben
        file.write((int(text[x])).to_bytes())

    file.close()
#    print(os.listdir('/sd'))                                                            # dir ausgeben
    print("\r\n" + "SAVE ok")

# Hauptprogramm

spi=SPI(1,baudrate=40000000,sck=Pin(10),mosi=Pin(11),miso=Pin(12))
try:
    sd=sdcard.SDCard(spi,Pin(13))
    vfs=os.VfsFat(sd)
    os.mount(sd,'/sd')
except Exception as e:
    print("Fehler:", e)

systime = time.time()

while(True):
    if(systime+2 < time.time()):                                                         # alle 2 sekunden ein kurzes led lebenszeichen
        led.on()
        time.sleep_ms(20)
        led.off()
        systime = time.time()
        
    anzahl = uart1.any()
    if(anzahl>0):
        t = uart1.read(1)
        if(t==b'D'):
            load_datei()                                                                 # datei mit name datei.z80 von sd karte zum z1013 landen
        if(t==b'S'):
            save_datei()                                                                 # datei vom z1013 auf sd karte speichern
        if(t==b'L'):
            load()                                                                       # datei vom z1013 incl. anzeige dir laden
