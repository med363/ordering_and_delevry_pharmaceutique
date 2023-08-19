const router3= require('express').Router();
const stockeController = require("../controller/stocke.controller")

router3.post('/stocke_pharmacy',stockeController.register);
router3.get('/all_stocks', stockeController.getAllStocks);

module.exports =router3;