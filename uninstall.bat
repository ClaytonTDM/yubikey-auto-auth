@echo off
:nodejs-postinstall
if exist "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Node.js" (
goto nodejs-install
)
goto cleanup

:nodejs-install
echo Preparing Environment...
echo Uninstalling Node.js...
echo.
title Uninstalling Node.js...
winget uninstall nodejs
cls
goto nodejs-postinstall

:cleanup
echo Cleaning Up Files...
echo.
title Cleaning Up Files...
del %temp%\npm-installed
cls
echo Uninstalled.
pause
rmdir /s /q %cd%
exit
