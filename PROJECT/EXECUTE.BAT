@echo off
setlocal

call PROJINFO.BAT
start ..\BGBEMU\bgb.exe -watch -rom ..\BINARY\%Output%

endlocal
