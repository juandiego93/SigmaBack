const config = {
    user: 'sigma',
    password: '1234',
    server: 'localhost',
    database: 'SIGMA'
};

const userController = {

    all(request, response) {

    },

    byId(request, response) {

    },

    create(request, response) {
        const user = request.body
        const sql = require('mssql')
        sql.connect(config).then(pool => {
            return pool.request()
                .input('departament', sql.VarChar(50), user.departamento)
                .input('city', sql.VarChar(50), user.ciudad)
                .input('name', sql.VarChar(50), user.nombre)
                .input('email', sql.VarChar(50), user.correo)
                .execute('createUser')
        }).then(result => {
            response.json({
                message: 'User Created',
                ok: true,
                idUser: result.recordset[0].id
            })
        }).catch(err => {
            console.log('ERROR:// ', err);
            response.status(500).json({
                err,
                message: 'Error al crear el nuevo cliente',
                ok: false
            })
        })


    },

    update(request, response) {

    },

    remove(request, response) {

    }

}

module.exports = userController