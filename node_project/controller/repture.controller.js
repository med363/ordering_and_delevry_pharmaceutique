const ReptureService= require('../services/repture.services')

exports.register = async (req, res, next) => {
    try {
        
        const {Name_medicament} = req.body;
        const successRes = await ReptureService.RepturePharmacy(
            Name_medicament
        );
        res.json({ status: true, success: "Pharmacy Repture du stocke Register successfully" });
    } catch (error) {
        throw error;
    }
}

exports.getAllrepture = async (req, res, next) => {
    try {
        const al = await ReptureService.getAllrepture();
        res.json({ status: true, repture: al });
    } catch (error) {
        throw error;
    }
}