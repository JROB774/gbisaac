@ECHO off
SETLOCAL

CALL INFO.BAT
START BGB\bgb.exe -watch -rom BIN\%output%

ENDLOCAL
