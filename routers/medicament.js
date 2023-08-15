// const express = require('express')
// const {GetProducts, GetProductsByID ,AddProducts }= require('../controllers/products')
// const router = express.Router()

// // router.get('/products',GetProducts)
// router.get('/products/:id',GetProductsByID)
// // router.post('/products',AddProducts) 
// //****simpifier les 2 routes dans une seul line
// router.route('/products').get(GetProducts).post(AddProducts)

// module.exports= router

// API ensemble de route et on applique les methode CRUD de mongodb

const express = require('express')
const medicalController = require('../controller/medicaments.controller')
const router = express.Router()

router.post('/create', medicalController.create)
router.get('/find', medicalController.getAll)
router.get('/findOne/:id',medicalController.getOne)
router.put('/update/:id', medicalController.updateMedication)
router.delete('/delete/:id', medicalController.deleteMedication)

module.exports = router 