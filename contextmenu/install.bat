@echo off
pushd %~dp0
set script="%cd%/script/install-new-dot-file.ps1"
popd
rem echo script = %script%
powershell.exe -ExecutionPolicy Bypass %script%
pause