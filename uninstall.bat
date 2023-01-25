@echo off
:ykman-postinstall
if exist "C:\Program Files\Yubico\YubiKey Manager CLI\ykman.exe" (
goto ykman-install
)
:authenticator-postinstall
if exist "C:\Program Files\Yubico\Yubico Authenticator\authenticator.exe" (
goto authenticator-install
)
if exist "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Node.js" (
goto nodejs-install
)
goto cleanup

:ykman-install
echo Preparing Dependencies...
echo Downloading YubiKey Manager CLI Uninstaller...
echo.
title Downloading YubiKey Manager CLI Uninstaller...
curl https://developers.yubico.com/yubikey-manager/Releases/yubikey-manager-5.0.1-win64.msi -o %temp%\cli.msi
cls
echo Preparing Dependencies...
echo Uninstalling YubiKey Manager CLI...
echo.
title Uninstalling YubiKey Manager CLI...
msiexec.exe /x %temp%\cli.msi
del %temp%\cli.msi
cls
goto ykman-postinstall

:authenticator-install
echo Preparing Dependencies...
echo Downloading Yubico Authenticator Uninstaller...
echo.
title Downloading Yubico Authenticator Uninstaller...
curl https://developers.yubico.com/yubioath-flutter/Releases/yubico-authenticator-6.0.2-win64.msi -o %temp%\auth.msi
cls
echo Preparing Dependencies...
echo Uninstalling Yubico Authenticator...
echo.
title Uninstalling Yubico Authenticator...
msiexec.exe /x %temp%\auth.msi
del %temp\auth.msi
cls
goto authenticator-postinstall

:nodejs-install
echo Preparing Environment...
echo Uninstalling Node.js...
echo.
title Uninstalling Node.js...
winget uninstall nodejs
cls
goto cleanup

:cleanup
echo Cleaning Up Files...
echo.
title Cleaning Up Files...
rmdir /s /q .git
del index.js
del package.json
del start.bat
del test.bat
del test.js
del .gitignore
del LICENSE
del README.md
cls
echo Uninstalled! You may now delete this file.
pause
exit
