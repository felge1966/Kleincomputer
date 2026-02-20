@echo off
rem V.Pohlers 2017
if !%1 == ! (goto showlist) else (goto %1)

::::::::::::::::::::::::::::::::::::::::
:showlist
echo Bitte geben Sie ein Kommando aus der Liste an:
echo.
for /F "tokens=1,2,*" %%f in (%~f0) do call :listline %%f %%g %%h
goto :eof

:listline
set $line=%1
if !%$line:~0,1% == !: if /i !%2 == !.entry echo %$line:~1% = %~3
set $line=
exit /batch

::::::::::::::::::::::::::::::::::::::::
:ALL .entry "alles"
call :BOOT
call :CPA
call :DISK
goto :eof

::::::::::::::::::::::::::::::::::::::::
:BOOT .entry "boot1013 erzeugen"
call as boot1013.asm
goto :eof

::::::::::::::::::::::::::::::::::::::::
:CPA .entry "CP/A kompilieren"
call as cpa_Z1013.asm
goto :eof

::::::::::::::::::::::::::::::::::::::::
:DISK .entry "Bootsdisk erstellen"
copy leer.dsk ..\z1013cpa.dsk
cpmcp -f z9001 ..\z1013cpa.dsk @z1013.com 0:
copy diskdefs ..\bootdisk\
copy info.com ..\bootdisk\
cd ..\bootdisk
..\src\cpmcp -f z9001 ..\z1013cpa.dsk *.* 0:
cd ..\src
rem cpmls -f z9001 z1013cpa.dsk
goto :eof

::::::::::::::::::::::::::::::::::::::::
:DIST .entry "Archiv packen"
copy *.com ..
copy *.z80 ..
copy z1013cpa.dsk ..
pushd ..
zip z1013_cpa_%date%.zip 00liesmich *.com *.Z80 z1013cpa.dsk src\*.asm  src\*.inc src\*.lst src\*.bat src\leer.dsk bootdisk\*.* src\diskdefs src\cpmcp.exe src\*.pl src\info.*
popd
goto :eof

:eof
