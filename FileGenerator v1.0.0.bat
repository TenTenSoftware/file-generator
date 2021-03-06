@echo off
title File generator
set loop=0

set /p dirselect=Choose folder name (without spaces):
mkdir %dirselect%
cd %dirselect%
if errorlevel 1 goto error

set /p a=Choose amount of files:
setlocal enableextensions enabledelayedexpansion
set /a Test=a
if !Test! EQU 0 (
  if !a! EQU 0 (
    echo All ok
  ) else (
    goto :numerr
  )
) else (
  echo All OK
)
if %a%==0 goto next
:loop
set /a loop=%loop%+1
echo %loop%. file >%loop%.txt
echo [%time%] Generated %loop%. file
if "%loop%"=="%a%" goto next
goto loop

:error
cls
color 0c
echo Error: Can't make folder. Possible causes:
echo - The folder name contains forbidden characters.
echo - No permissions granted.
echo - Can't write in this directory.
echo - Be sure your folder name does not contain spaces in name.
echo Press any key to exit...
pause >nul
exit

:numerr
cls
color 0c
echo Error: %a% is not a valid value
pause
exit

:next
echo %loop% files generated in %cd%. Press any key to exit...
pause >nul
