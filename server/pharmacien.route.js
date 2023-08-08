const router1= require('express').Router();
const express = require( 'express');
const PharamacienController = require("../controller/pharamcien.controller")
const multer = require('multer');
const path = require('path');
const user_route = express();


user_route.use(express.static('public'))


const storage = multer.diskStorage({
    destination:function(req,file,cb){
        cb(null, path.join(__dirname,'../public/images'))
    },
    filename:(req,file,cb)=>{
        const name= Date.now()+'-'+file.originalname;
        cb(null,name)
    }
});

const upload = multer({ storage:storage});


// router1.post('/registration_pharmacien',PharamacienController.register);
router1.post('/registration_pharmacien', upload.single('image'),PharamacienController.register);
router1.post('/login_pharmacien', PharamacienController.login);
module.exports =router1;