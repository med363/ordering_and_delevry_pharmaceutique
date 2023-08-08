const router = require('express').Router();
const UserController = require("../controller/user.controller")

router.post('/registration_user',UserController.register);
router.post("/login_user", UserController.login);
module.exports =router;