const router4= require('express').Router();
const reptureController = require("../controller/repture.controller")

router4.post('/repture_pharmacy',reptureController.register);
router4.get('/all_repture', reptureController.getAllrepture);

module.exports =router4;