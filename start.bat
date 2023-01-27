@echo off
if not DEFINED IS_MINIMIZED set IS_MINIMIZED=1 && start "" /min "%~dpnx0" %* && exit
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
echo Almost done! Press any key to finish installation. Once installation is done, open this file again to start the authenticator.
pause > nul
echo true > %temp%\npm-installed
npm i
exit
) else (
npm start
)