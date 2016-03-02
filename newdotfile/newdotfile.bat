@echo off
pushd %~dp0
set script="%cd%/script/newdotfile.ps1"
popd
rem echo script = %script%
powershell.exe -ExecutionPolicy Bypass %script%