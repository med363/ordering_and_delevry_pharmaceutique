const router2= require('express').Router();
const PharamacyController = require("../controller/pharmacy.controller")

router2.post('/information_pharmacy',PharamacyController.register);


module.exports =router2;