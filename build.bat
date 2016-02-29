@echo off
echo I don't know why I made this
echo ...maybe I do...
echo ----------------------------
mkdir output
mkdir output\script
mkdir output\regkey
copy src\newdotfile\*.bat output
copy src\newdotfile\*.ps1 output\script
copy src\newdotfile\regkey\*.reg output\regkey
copy installing.txt output
pause