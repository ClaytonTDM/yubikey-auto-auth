@echo off
:ykman-postinstall
if not exist "C:\Program Files\Yubico\YubiKey Manager CLI\ykman.exe" (
goto ykman-install
)
:authenticator-postinstall
if not exist "C:\Program Files\Yubico\Yubico Authenticator\authenticator.exe" (
goto authenticator-install
)
if not exist "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Node.js" (
goto nodejs-install
)
goto start

:ykman-install
echo Preparing Dependencies...
echo Downloading YubiKey Manager CLI...
echo.
title Downloading YubiKey Manager CLI...
curl https://developers.yubico.com/yubikey-manager/Releases/yubikey-manager-5.0.1-win64.msi -o %temp%\cli.msi
cls
echo Preparing Dependencies...
echo Installing YubiKey Manager CLI...
echo.
title Installing YubiKey Manager CLI...
msiexec.exe /i %temp%\cli.msi
del %temp%\cli.msi
cls
goto ykman-postinstall

:authenticator-install
echo Preparing Dependencies...
echo Downloading Yubico Authenticator...
echo.
title Downloading Yubico Authenticator...
curl https://developers.yubico.com/yubioath-flutter/Releases/yubico-authenticator-6.0.2-win64.msi -o %temp%\auth.msi
cls
echo Preparing Dependencies...
echo Installing Yubico Authenticator...
echo.
title Installing Yubico Authenticator...
msiexec.exe /i %temp%\auth.msi
del %temp\auth.msi
cls
goto authenticator-postinstall

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