@echo off
if not exist "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Node.js" (
goto nodejs-install
)
goto start-install

:nodejs-install
echo Preparing Environment...
echo Installing Node.js...
echo.
title Installing Node.js...
winget install nodejs
cls
echo Installed dependencies! Re-open this file to start part 2 of the installaton.
pause
exit

:start-install
if not exist "%temp%\npm-installed" (
echo Almost done! Type "npm i && echo true > %temp%\npm-installed && start.bat" to continue.
cmd /k
exit
) else (
if not DEFINED IS_MINIMIZED set IS_MINIMIZED=1 && start "" /min "%~dpnx0" %* && exit
npm start
)
