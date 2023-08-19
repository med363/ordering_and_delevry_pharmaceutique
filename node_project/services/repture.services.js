const reptureModel = require('../model/repture')
const jwt = require("jsonwebtoken")
class ReptureService{
       static async RepturePharmacy(Name_medicament){
        try{
            const repturePharmacy = new reptureModel({Name_medicament});
              return await repturePharmacy.save();

        }catch(error){
            throw error;
        }
    }
    
    static async getAllrepture() {
        try {
            const al = await reptureModel.find();
            return al;
        } catch (error) {
            throw error;
        }
    }
}
module.exports = ReptureService;