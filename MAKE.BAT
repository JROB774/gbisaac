@ECHO off
SETLOCAL

CALL INFO.BAT

IF NOT EXIST BIN MKDIR   BIN
PUSHD SRC

..\RGB\rgbasm %define% -o %object% %source%
..\RGB\rgblink -o %output% %object%
..\RGB\rgbfix -v -p 0 %output%

DEL *.O

POPD

ENDLOCAL
