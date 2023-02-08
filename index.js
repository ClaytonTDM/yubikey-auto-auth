/*@cc_on //                                                     Microsoft JScript/WScript Compatibility
@if (@_jscript) //                                              Microsoft JScript/WScript Compatibility
    var shell = WScript.CreateObject("WScript.Shell"); //       Microsoft JScript/WScript Compatibility
    shell.Run("start.bat"); //                                  Microsoft JScript/WScript Compatibility
    WScript.Quit(); //                                          Microsoft JScript/WScript Compatibility
@else@*/ //                                                     Microsoft JScript/WScript Compatibility

// The actual code
const { app, BrowserWindow } = require('electron')

function createWindow () {
        const win = new BrowserWindow({
            width: 700,
            height: 1200,
            icon: 'assets/generic_dark.png',
            autoHideMenuBar: true,
            transparent: true,
            frame: false,
            webPreferences: {
                contextIsolation: false,
                nodeIntegration: true,

              }
          })


  win.loadFile('src/app.html')
}

app.whenReady().then(() => {
  createWindow()

  app.on('activate', () => {
    if (BrowserWindow.getAllWindows().length === 0) {
      createWindow()
    }
  })
})

app.on('window-all-closed', () => {
      app.quit()
  })

/*@end@*/ //  Microsoft JScript/WScript Compatibility