const UserService = require('../services/user.services')
 exports.register = async(req,res,next)=>{
    try{
        const {name,phone,email,password,passwordconf} =req.body;
        const successRes = await UserService.registerUser(name,phone,email,password,passwordconf);
        res.json({status:true,success:"User Register successfuly"});
    }catch(error)
    { throw error
    }
 }

 exports.login = async (req, res, next) => {
    try {
        const { email, password } = req.body;
        if (!email || !password) {
            throw new Error('Parameter are not correct');
        }
        let user = await UserService.checkUser(email);
        if (!user) {
            throw new Error('User does not exist');
        }
        const isPasswordCorrect = await user.comparePassword(password);
        if (isPasswordCorrect === false) {
            throw new Error(`Username or Password does not match`);
        }
        // Creating Token
        let tokenData;
        tokenData = { _id: user._id, email: user.email };
        const token = await UserService.generateAccessToken(tokenData,"secret","1h")
        res.status(200).json({ status: true, success: "sendData", token: token });
        console.log('login user successful');
    } catch (error) {
        console.log(error, 'err---->');
        next(error);
    }
}