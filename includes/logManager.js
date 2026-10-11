// FIX: original `require('./databaseGateway')` at module load — if logManager is required
// before databaseGateway is fully initialized (circular-ish), `db.maindb` could be undefined.
// Lazy-load it inside the functions instead.
const getDb = () => require('./databaseGateway');

module.exports = {
    log: (type, message) => {
        const db = getDb();
        db.maindb.get('admin.logs').push({
            "time": new Date(),
            type: type.name,
            message
        }).write();
        console.log(type.name, message);
    },
    getLogs: () => {
        const db = getDb();
        return db.maindb.get('admin.logs').sortBy('time').reverse().value();
    }
};