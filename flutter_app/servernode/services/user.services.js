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

    static async checkcode(resetCode){
        try {
            return await UserModel.findOne({resetCode});
        } catch (error) {
            throw error;
        }
    }



    static async generateAccessToken(tokenData,JWTSecret_Key,JWT_EXPIRE){
        return jwt.sign(tokenData, JWTSecret_Key, { expiresIn: JWT_EXPIRE });
    }

    // static async decryptPassword(password) {
    // try {
    //     const decryptedPassword = Buffer.from(password, 'base64').toString('utf8');
    //     return decryptedPassword;
    // } catch (error) {
    //     throw error;
    // }
    
    // static async decryptPassword(password) {
    //     try {
    //         return await UserModel.decrypted(password);
    //     } catch (error) {
    //         throw error;
    //     }
    // }




}

module.exports = UserService;