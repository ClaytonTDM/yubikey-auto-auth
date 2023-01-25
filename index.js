/*@cc_on //                                                     Microsoft JScript Compatibility
@if (@_jscript) //                                              Microsoft JScript Compatibility
    var shell = WScript.CreateObject("WScript.Shell"); //       Microsoft JScript Compatibility
    shell.Run("start.bat"); //                                  Microsoft JScript Compatibility
    WScript.Quit(); //                                          Microsoft JScript Compatibility
@else@*/ //                                                     Microsoft JScript Compatibility

// The actual code
const { exec } = require("child_process");
var open;

process.title = "Yubico Auto Authenticator Opener";
setTimeout(function() { console.clear(); console.log('Started. Try plugging in a YubiKey!\n'); }, 1500);
setInterval(function () {

    // Process Check
    const isRunning = (query, cb) => {
        let cmd = 'tasklist';
        exec(cmd, (err, stdout, stderr) => {
            cb(stdout.toLowerCase().indexOf(query.toLowerCase()) > -1);
        });
    }
    isRunning("authenticator.exe", e => { open = e });

    // Key Check
    exec("\"C:/Program Files/Yubico/YubiKey Manager CLI/ykman.exe\" list", (error, stdout, stderr) => {
        if (error) {
            return false;
        }
        if (stderr) {
            return false;
        }

        if (stdout != '' && open == false) {
            console.log(stdout + '\nAuthenticator Opened\n');
            exec('"C:/Program Files/Yubico/Yubico Authenticator/authenticator.exe"', [], (o, i, t) => {
                console.log('Yubikey Disconnected\n\nAuthenticator closed\n')
            });
        } else {
            if (stdout == '' && open == true) {
                exec('taskkill /f /im authenticator.exe /t', [], (o, i, t) => { });
            }
        }
    });
}, 1500);
/*@end@*/ //  Microsoft JScript Compatibility