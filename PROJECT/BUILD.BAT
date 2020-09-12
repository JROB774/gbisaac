@echo off
setlocal

call PROJINFO.BAT

pushd ..

if not exist BINARY mkdir BINARY
pushd SOURCE

..\RGBDS\rgbasm  -o %Object% %Source%
..\RGBDS\rgblink -o %Output% %Object%
..\RGBDS\rgbfix  -v -p 0 %Output%

del *.O

popd
popd

endlocal
