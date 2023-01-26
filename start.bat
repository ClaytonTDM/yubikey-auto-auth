@echo off
if not exist "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Node.js" (
goto nodejs-install
)
goto start

:nodejs-install
echo Preparing Environment...
echo Installing Node.js...
echo.
title Installing Node.js...
winget install nodejs
cls
echo Installed! Re-open this file to start the Authenticator.
pause
exit

:start
npm start
pause
exit