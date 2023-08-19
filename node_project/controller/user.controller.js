const UserService = require('../services/user.services')
const nodemailer = require('nodemailer');

 exports.register = async(req,res,next)=>{
    try{
        const {name,phone,email,password,passwordconf} =req.body;
        const successRes = await UserService.registerUser(name,phone,email,password,passwordconf);
        res.json({status:true,success:"User Register successfuly"});
        console.log('user Pharmacien Register successfully');
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
        res.status(200).json({ status: true, success: "sendData", token: token ,username : user.name });
        console.log('login user successful');
    } catch (error) {
        console.log(error, 'err---->');
        next(error);
    }
 }

    exports.forgetpass = async (req, res) => {
        try {
            const { email } = req.body;
           let user = await UserService.checkUser(email);
           
            if (!user) {
                return res.status(404).json({ message: 'User not found' });
            }
    
            // const token = Math.random().toString(36).substring(2, 15) + Math.random().toString(36).substring(2, 15);
            // user.resetPasswordToken = token;
            // user.resetPasswordExpires = Date.now() + 3600000; // token valid for an hour
            // // await user.save();
    
            const transporter = nodemailer.createTransport({
                service: 'gmail',
                auth: {
                    user: 'chadhajamel47@gmail.com',
                    pass: 'fgmeplraufkzgrnh'
                }
            });
            
            const resetCode = Math.floor(100000 + Math.random() * 900000);
            user.resetCode = resetCode;
            await user.save({ fields: ['resetCode'] });
            
            const mailOptions = {
                from: 'chadhajamel47@gmail.com',
                to: user.email,
                subject: 'Réinitialisation de mot de passe',
                html: `
                <p>Bonjour,</p>
                <p>Vous avez demandé une réinitialisation de votre mot de passe. Votre code de réinitialisation est <strong><b style="color: rgba(187, 5, 5, 0.983);">${resetCode}</strong>.</p>
            `   };
            
            await transporter.sendMail(mailOptions);
            console.log('Email sent successfully');
            return res.status(200).json({ message: 'Password reset email sent successfully' });
         } catch (error) {
            console.log(error);
            return res.status(500).json({ message: 'Internal server error' });
        }
    }
 exports.code =  async (req, res) => {
    try {
        const {resetCode } = req.body;
      const user = await UserService.checkcode(resetCode);
      if (!user) {
        return res.send('Invalid reset code');
      }
      if (!user.password) {
        return res.send('No password set for user');
      }
      console.log('your password:', user.password);
      // const decryptedPassword = await UserService.decryptPassword(user.password); 
    //   const salt1 =await(bcrypt.genSalt(10));
    //   const hashpassconf = await bcrypt.hash(user.password,salt1);
   const Password = user.decrypted(user.password)
    console.log('decrypt password:',Password);
 // console.log('decrypt password:',user.Password_decrypted);
      const transporter = nodemailer.createTransport({
        service: 'gmail',
        auth: {
          user: 'chadhajamel47@gmail.com',
          pass: 'fgmeplraufkzgrnh'
        }
      });
      const mailOptions = {
        from: 'chadhajamel47@gmail.com',
        to: user.email,
        subject: 'Password Reset Successful',
        html: `<p>Hello,</p><p>Your password is: <strong><b style="color: rgba(187, 5, 5, 0.983);">${Password}</strong></p></br>Please login with your password.\n`
      };
  
      await transporter.sendMail(mailOptions);
      console.log('Email sent successfully');
      return res.status(200).json({ message: 'email sent successfully' });

    } catch (err) {
      console.error(err);
      res.send('Error resetting password');
    }
  }
