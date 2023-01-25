# Yubico Auto Authenticator Opener for Windows
Automatically opens Yubico Authenticator when a compatible YubiKey is attached.

## Installation

1. Click the big green Code button
<img src="https://cdn.clickette.net/brave_8wcEdot6P9/direct" style="max-width: 50%;">

2. Click Download As Zip
<img src="https://cdn.clickette.net/brave_JgWe9Om1xw/direct" style="max-width: 50%;">

3. Open the zip file that was just downloaded to your computer
<img src="https://cdn.clickette.net/5kVMW97DTt/direct" style="max-width: 50%;">

4. Click Extract All
<img src="https://cdn.clickette.net/explorer_LBdFOd2i0a/direct" style="max-width: 50%;">

5. Make sure all checkboxes are checked & click Extract
<img src="https://cdn.clickette.net/explorer_omdOHJW5AE/direct" style="max-width: 50%;">

6. *Double* click on yubikey-auto-auth-main
<img src="https://cdn.clickette.net/explorer_8yLfQ1Ylpv/direct" style="max-width: 50%;">

7. Double click on start.bat & follow the installation steps (you may need to hit Run as well)
<img src="https://cdn.clickette.net/explorer_nzCyQn6lof/direct" style="max-width: 50%;">

8. When prompted, double click on start.bat *again*.

9. Done! You can now minimize the black window that appeared & plug in your YubiKey.

## FAQ

**Q:** What does this code do (in full detail)?

**A:** This script is designed to automatically open the Yubico Authenticator application when a compatible YubiKey is plugged into the computer. The script uses the Node.js child_process module to run command line commands, such as checking if the Yubico Authenticator application is already running, and checking if a YubiKey is currently connected to the computer. The script also includes Microsoft JScript compatibility code, which is used to run a separate start.bat file that can prepare dependencies for the script, such as installing the YubiKey Manager CLI or the Yubico Authenticator application if they are not already present on the computer. The package.json file contains information about the project, including the name, version, description, main file, and author. The start.bat file contains a series of commands to download and install necessary dependencies for the script, such as the Yubico Authenticator application, the Yubico Manager CLI and Node.js.


**Q:** Is it safe?

**A:** The script uses the curl command to download the YubiKey Manager CLI and Yubico Authenticator applications from the official Yubico website. These are the official files provided by Yubico, so it is safe to use on your computer as long as you trust the Yubico website.


**Q:** What are the benefits of using this?

**A:** The main benefit of using this script is that it automates the process of opening the Yubico Authenticator application when a compatible YubiKey is plugged into the computer. This can save time and effort, as the user no longer needs to manually open the application each time they want to use their YubiKey for authentication. Another benefit of this script is that it checks if the Yubico Authenticator application is already running and it closes it when the YubiKey is disconnected. This ensures that the application is only open when the YubiKey is connected, which can help to conserve system resources and minimize the risk of leaving the application open when it is not in use. Additionally, the script include a start.bat file which can help to prepare dependencies for the script, such as installing the YubiKey Manager CLI or the Yubico Authenticator application if they are not already present on the computer, thus making it convenient for the user to set up the script and use it. Overall, the script can simplify the process of using a YubiKey for authentication, by automating the opening and closing of the Yubico Authenticator application based on the presence of a YubiKey.
