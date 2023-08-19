const StockeService = require('../services/stocke.services')

exports.register = async (req, res, next) => {
    try {
        
        const {Name_stocke,quantite_stocke} = req.body;
        const successRes = await StockeService.stockePharmacy(
            Name_stocke,quantite_stocke
        );
        res.json({ status: true, success: "Pharmacy stocke Register successfully" });
    } catch (error) {
        throw error;
    }
}

exports.getAllStocks = async (req, res, next) => {
    try {
        const allStocks = await StockeService.getAllStocks();
        res.json({ status: true, stocks: allStocks });
    } catch (error) {
        throw error;
    }
}