@echo off

echo ^| Text Edit ^| Filename: %1 ^|
echo.

chcp 65001
setlocal enabledelayedexpansion

set lineLen=0

:get_line
	set /p line=
	
	if "%line%" == ":w" goto save
	
	set /a i=!i!+1
	set buffer[!i!]=%line%
	set line=
goto get_line

:save
	echo.>%1
	for /L %%i in (1,1,%i%) do (
		echo !buffer[%%i]!>>%1
	)
exit
