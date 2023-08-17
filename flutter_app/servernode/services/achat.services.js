const achatModel = require('../model/achat')
const jwt = require("jsonwebtoken")
class AchatService{
       static async AchatPharmacy(noms,type,Number,prix,patient,ordonnance){
        try{
            const achatPharmacy = new achatModel({noms,type,Number,prix,patient,ordonnance});
              return await achatPharmacy.save();

        }catch(error){
            throw error;
        }
    }
    
    static async getAllachat() {
        try {
            const al = await achatModel.find();
            return al;
        } catch (error) {
            throw error;
        }
    }
}
module.exports = AchatService;