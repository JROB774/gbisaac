@echo off
setlocal

call PROJINFO.BAT
pushd ..
BGBEMU\bgb.exe BINARY\%Output%
popd

endlocal
