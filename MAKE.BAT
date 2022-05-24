@ECHO off
SETLOCAL

CALL INFO.BAT

IF NOT EXIST BIN MKDIR   BIN
PUSHD SRC

..\RGB\rgbasm %define% -o %object% %source%
..\RGB\rgblink -n %output%.SYM -o %output%.GB %object%
..\RGB\rgbfix -v -p 0 %output%.GB

DEL *.O

POPD

ENDLOCAL
