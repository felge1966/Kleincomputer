@echo off
rem Standard-Skript zum Aufruf des Arnold-Assemblers
rem V.Pohlers 2009
rem als Parameter wird der Name der asm-Datei übergeben

set file=%1
if "%1"=="" set file=cpa_z1013.asm

for %%i in (%file%) do set file=%%~ni

echo -------- %file% -----------

set bin=%cd:~,2%\hobby\Programme\as\bin
if %COMPUTERNAME%==P4-2600 set bin=c:\user\hobby\Programme\as\bin

%bin%\as.exe -L %file%.asm
%bin%\p2bin.exe -r $-$ "%file%.p"
%bin%\plist.exe "%file%.p"

com2z80.pl %file%.bin 100
copy %file%.bin ..\%file%.com
copy cpa_z1013.bin @z1013.com
copy cpa_z1013.bin ..\@z1013.com
copy %file%.z80 ..
