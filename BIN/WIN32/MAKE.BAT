@ECHO off
SETLOCAL

CALL CONFIG.BAT

PUSHD ..\..

IF NOT EXIST ROM MKDIR ROM
PUSHD SRC

..\BIN\WIN32\RGBASM %define% -o %object% %source%
..\BIN\WIN32\RGBLINK -n %output%.SYM -o %output%.GB %object%
..\BIN\WIN32\RGBFIX -v -p 0 %output%.GB

DEL *.O

POPD
POPD

ENDLOCAL
