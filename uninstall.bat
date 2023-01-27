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
rmdir /s /q data_authenticator
rmdir /s /q data_ykman
del index.js
del package.json
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
