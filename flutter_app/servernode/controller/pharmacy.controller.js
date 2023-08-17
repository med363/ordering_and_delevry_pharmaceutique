const PharmacyService = require('../services/pharmacy.service')

exports.register = async (req, res, next) => {
    try {
        
        const {pharmacyName,pharmacyLocation} = req.body;
        const successRes = await PharmacyService.registerPharmacy(
            pharmacyName,pharmacyLocation
        );
        res.json({ status: true, success: "Pharmacy Register successfully" });
    } catch (error) {
        throw error;
    }
}