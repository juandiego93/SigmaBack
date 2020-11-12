const express = require('express')
const bodyParser = require('body-parser')
const sql = require("mssql");
const cors = require('cors')
const app = express()

app.use(bodyParser.urlencoded({ extended: false }))
app.use(bodyParser.json())
app.use(cors({
    "origin": "*",
    "methods": "GET,HEAD,PUT,PATCH,POST,DELETE",
    "preflightContinue": false,
    "optionsSuccessStatus": 204
}))

app.use(bodyParser.urlencoded({ extended: false }))
app.use(bodyParser.json())
app.use(require('../routes/routes'))

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

app.get('/', (request, response) => {
    response.json('Hola mundo')
})

app.listen((process.env.PORT || 3000), function () {
    console.log('Server running:', process.env.PORT || 3000);
})