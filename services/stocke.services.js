const stockeModel = require('../model/stocke')
const jwt = require("jsonwebtoken")
class StockeService{
       static async stockePharmacy(Name_stocke,quantite_stocke){
        try{
            const stockePharmacy = new stockeModel({Name_stocke,quantite_stocke});
              return await stockePharmacy.save();

        }catch(error){
            throw error;
        }

    }

    static async getAllStocks() {
        try {
            const allStocks = await stockeModel.find();
            return allStocks;
        } catch (error) {
            throw error;
        }
    }



    
}
module.exports =StockeService;