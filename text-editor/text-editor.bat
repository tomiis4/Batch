@echo off

echo ^| Text Edit ^| Filename: %1 ^|
echo.

:get_input
set /p line=

:: commands
if "%line%" == ":q" goto exit
if "%line%" == ":w" goto save 
if "%line%" == ":wq" goto exit_save
if "%line%" == ":cls" goto clear_screen

echo %line%>>save.txt


goto get_input

:: command functions

:: copy save file and put it in main file
:save 
copy save.txt "%~1"
del save.txt
goto get_input

:: clear screen
:clear_screen
cls
goto get_input

:: exit editor
:exit
exit

:: exit and save
copy save.txt "%~1"
del save.txt
exit
