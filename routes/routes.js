const express = require('express')
const router = express.Router()

//import controllers
const userController = require('../controllers/userController')

router.get('/controllers', (request, response) => {
    response.send('routes controllers')
})
 
router.post('/createUser', userController.create)
router.post('/updateUser', userController.update)
router.get('/removeUser/:id', userController.remove)

module.exports = router