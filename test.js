/*@cc_on //                                                     Microsoft JScript/WScript Compatibility
@if (@_jscript) //                                              Microsoft JScript/WScript Compatibility
    var shell = WScript.CreateObject("WScript.Shell"); //       Microsoft JScript/WScript Compatibility
    shell.Run("start.bat"); //                                  Microsoft JScript/WScript Compatibility
    WScript.Quit(); //                                          Microsoft JScript/WScript Compatibility
@else@*/ //                                                     Microsoft JScript/WScript Compatibility

const { exec } = require("child_process");
var open;
setInterval(function() {

    // Process Check
    const isRunning = (query, cb) => {
        let platform = process.platform;
        let cmd = '';
        switch (platform) {
            case 'win32' : cmd = `tasklist`; break;
            case 'darwin' : cmd = `ps -ax | grep ${query}`; break;
            case 'linux' : cmd = `ps -A`; break;
            default: break;
        }
        exec(cmd, (err, stdout, stderr) => {
            cb(stdout.toLowerCase().indexOf(query.toLowerCase()) > -1);
        });
    }
    isRunning("authenticator.exe",e=>{open=e});

    // Key Check
exec("\"C:/Program Files/Yubico/YubiKey Manager CLI/ykman.exe\" list", (error, stdout, stderr) => {
    if (error) {
        return false;
    }
    if (stderr) {
        return false;
    }
    
    if (stdout != '' && open == false) {
        console.log(stdout);
    }
});
}, 1000);

/*@end@*/ //  Microsoft JScript/WScript Compatibility
