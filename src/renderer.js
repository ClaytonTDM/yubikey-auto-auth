function isElectron(){return!!("undefined"!=typeof window&&"object"==typeof window.process&&"renderer"===window.process.type||"undefined"!=typeof process&&"object"==typeof process.versions&&process.versions.electron||"object"==typeof navigator&&"string"==typeof navigator.userAgent&&navigator.userAgent.indexOf("Electron")>=0)}

if (isElectron()) {
    const { exec } = require("child_process");
var open;
function write_status(string) {
    console.log('Status: ' + string);
    document.getElementById('status_text').innerHTML = '<code>' + string + '</code>';
}
document.title = "Yubico AutoAuth";
setTimeout(function() { console.clear(); write_status('Started. Try plugging in a YubiKey!'); }, 1500);
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
    exec("\"data_ykman/ykman.exe\" list", (error, stdout, stderr) => {
        if (error) {
            return false;
        }
        if (stderr) {
            return false;
        }

        if (stdout != '' && open == false) {
            write_status(stdout + ' connected');
            exec('"data_authenticator/authenticator.exe"', [], (o, i, t) => {
                write_status('Yubikey Disconnected, Authenticator closed')
            });
        } else {
            if (stdout == '' && open == true) {
                exec('taskkill /f /im authenticator.exe /t', [], (o, i, t) => { });
            }
        }
    });
}, 1500);
} else {
    setTimeout(function(){
        document.getElementById('status_text').innerHTML = '<code>Uncaught ContainerError: File is not running inside Electron</code>';
    throw 'ContainerError: File is not running in Electron wrapper';
    }, 1500);
}
