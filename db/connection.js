const sql = require("mssql");

const config = {
    user: 'sigma',
    password: '1234',
    server: 'localhost',
    database: 'SIGMA'
};

sql.connect(config, function (err) {
    if (err) {
        console.log(err);
        throw new Error(err)
    }
    console.log('Database running');
});

module.exports.sql = sql