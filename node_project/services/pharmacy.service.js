const phModel = require('../model/pharmacy')
const jwt = require("jsonwebtoken")
class PharmacyService{
       static async registerPharmacy(pharmacyName,pharmacyLocation){
        try{
            const createPharmacy = new phModel({pharmacyName,pharmacyLocation});
              return await createPharmacy.save();

        }catch(error){
            throw error;
        }

    }
    
}
module.exports =PharmacyService;