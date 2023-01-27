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
rmdir /s /q .git
rmdir /s /q .github
rmdir /s /q .vscode
rmdir /s /q data_authenticator
rmdir /s /q data_ykman
rmdir /s /q assets
rmdir /s /q node_modules
rmdir /s /q src
del index.js
del package.json
del package-lock.json
del start.bat
del test.bat
del undecryptable-value-error-fix.bat
del test.js
del .gitignore
del LICENSE
del README.md
del %temp%\npm-installed
cls
echo Uninstalled.
pause
del uninstall.bat
exit
