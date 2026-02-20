### MiniBasic-Interpreter

Der MiniBasic-Interpreter des Ur-AC1 musste zugunsten der pico-Anpassungen aus dem EPROM-Bereich weichen.  
Um den Interpreter auch in Monitor-Variante 1 nutzen zu können, wurde er als nachladbare Funktion in den Flash des picoIO eingebaut.  
Von dort lässt er sich per "Z"-Kommando in den RAM ab 0F000h laden und starten.  

s. hierzu das Arbeitsblatt und Hinweise zur Zusatzbedienung in diesem Verzeichnis.

