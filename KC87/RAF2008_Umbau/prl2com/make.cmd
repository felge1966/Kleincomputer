set file=%1
if "%1" == "" set file=raf2x24o.mac
for %%f in (%file%) do set file=%%~nf

cpm m80.com =%file%.mac/z/l
cpm link.com %file%[op]
cpm prl2com %file%.prl

for %%d in (rel sym) do del %file%.%%d

bdiff %file%.com %file%.bin
