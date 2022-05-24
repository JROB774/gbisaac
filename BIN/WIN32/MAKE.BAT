@ECHO off
SETLOCAL

CALL CONFIG.BAT

PUSHD ..\..\SRC

:: IF "%~1"=="tools" GOTO MakeTools
:: IF "%~1"=="rom" GOTO MakeROM
:: GOTO Error

:: :MakeTools
..\BIN\WIN32\TCC TBOIDRAW.C -bench -I CRT -L CRT -o ..\BIN\WIN32\TBOIDRAW.EXE
..\BIN\WIN32\TCC TBOIMAP.C -bench -I CRT -L CRT -o ..\BIN\WIN32\TBOIMAP.EXE
:: GOTO End

:: :MakeROM
IF NOT EXIST ..\ROM MKDIR ..\ROM
..\BIN\WIN32\RGBASM %define% -o %object% %source%
..\BIN\WIN32\RGBLINK -n %output%.SYM -o %output%.GB %object%
..\BIN\WIN32\RGBFIX -v -p 0 %output%.GB
DEL *.O
:: GOTO End

:: :Error
:: ECHO please specify an argument for making:
:: ECHO rom   : build the rom
:: ECHO tools : build dev tools

:: :End

POPD
ENDLOCAL
