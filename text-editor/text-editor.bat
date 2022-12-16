@echo off

echo ^| Text Edit ^| Filename: %1 ^|
echo.


:: variables & config
setlocal enabledelayedexpansion
set buffer=()
set lineLength=0

:: functions

:get_line
	set /p line=
	
	:: commands
	:: if "%line%" == ":q" goto exit
	if "%line%" == ":w" goto save_file
	
	set buffer[!lineLength!]=%line%
	set /a lineLength=lineLength+1
goto get_line

:save_file
(
	for /L %%i in (0,1,%lineLength%-1) do (
		echo !buffer[%%i]!
	)
) > %1 
