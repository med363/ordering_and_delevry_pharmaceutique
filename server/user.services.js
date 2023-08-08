const UserModel = require('../model/user')
const jwt = require("jsonwebtoken")
class UserService{
       static async registerUser(name,phone,email,password,passwordconf){
        try{
            const createUser = new UserModel({name,phone,email,password,passwordconf});
              return await createUser.save();

        }catch(error){
            throw error;
        }

    }

    
    static async getUserByEmail(email){
        try{
            return await UserModel.findOne({email});
        }catch(err){
            console.log(err);
        }
    }
    static async checkUser(email){
        try {
            return await UserModel.findOne({email});
        } catch (error) {
            throw error;
        }
    }
    static async generateAccessToken(tokenData,JWTSecret_Key,JWT_EXPIRE){
        return jwt.sign(tokenData, JWTSecret_Key, { expiresIn: JWT_EXPIRE });
    }
}

module.exports = UserService;