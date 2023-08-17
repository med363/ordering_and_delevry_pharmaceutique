const PharmacienModel = require('../model/pharmacien')
const jwt = require("jsonwebtoken")
class PharamacienService{
       static async registerPharmacien(name,phone,email,password,passwordconf,profession,image){
        try{
            const createPharmacien = new PharmacienModel({name,phone,email,password,passwordconf,profession,image});
              return await createPharmacien.save();

        }catch(error){
            throw error;
        }

    }




    static async getPharmacienByEmail(email){
        try{
            return await PharmacienModel.findOne({email});
        }catch(err){
            console.log(err);
        }
    }


    static async getPharmacienByID(_id){
        try{
            return await PharmacienModel.findOne({_id});
        }catch(err){
            console.log(err);
        }
    }
    static async checkPharmacien(email){
        try {
            return await PharmacienModel.findOne({email});
        } catch (error) {
            throw error;
        }
    }
    static async generateAccessTokenp(tokenDatap,JWTSecret_Key,JWT_EXPIRE){
        return jwt.sign(tokenDatap, JWTSecret_Key, { expiresIn: JWT_EXPIRE });
    }

    static async addPharmacyData(pharmacienId,pharmacyName, pharmacyLocation) {
        try {
            const pharmacien = await PharmacienModel.findById(pharmacienId);
    
            if (!pharmacien) {
                throw new Error("Pharmacien not found");
            }
    
            pharmacien.pharmacyData = {pharmacyName, pharmacyLocation};
            return await pharmacien.save();
        } catch (error) {
            throw error;
        }
    }
    
}
module.exports = PharamacienService;