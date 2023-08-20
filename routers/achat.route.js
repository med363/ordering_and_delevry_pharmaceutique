const router5= require('express').Router();
const express = require( 'express');
const achatController = require("../controller/achat.controller")

const multer = require('multer');
const path = require('path');
const user_route = express();
const authMiddleware = require('../middlewares/auth.middleware');

user_route.use(express.static('public'))


const storage = multer.diskStorage({
    destination:function(req,file,cb){
        cb(null, path.join(__dirname,'../public/ordonnance'))
    },
    filename:(req,file,cb)=>{
        const name= Date.now()+'-'+file.originalname;
        cb(null,name)
    }
});

const upload = multer({ storage:storage});




router5.post('/achat_cbn', upload.single('ordonnance'),achatController.register);
router5.get('/all_achat', achatController.getAllachat);

module.exports =router5;