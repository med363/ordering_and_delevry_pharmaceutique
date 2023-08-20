const PharmacienService = require('../services/pharmacien.services')
 
exports.register = async (req, res, next) => {
    try {
        
        const { name, phone, email, password, passwordconf, profession,image } = req.body;
        const successRes1 = await PharmacienService.registerPharmacien(
            name,
            phone,
            email,
            password,
            passwordconf,
            profession,
            'images/' + req.file.filename  // Adding the image property
        );
        res.json({ status: true, success: "Pharmacien Register successfully" });
    } catch (error) {
        throw error;
    }
}
 
 exports.login = async (req, res, next) => {
    try {
        const { email, password } = req.body;
        if (!email || !password) {
            return res.status(400).json({ status: false, error: "Email and password are required" });
        }

        const pharma = await PharmacienService.checkPharmacien(email);
        if (!pharma) {
            return res.status(404).json({ status: false, error: "Pharmacien does not exist" });
        }

        const isPasswordCorrect = await pharma.comparePassword(password);
        if (!isPasswordCorrect) {
            return res.status(401).json({ status: false, error: "Incorrect password" });
        }

        // Creating Token
        const tokenDatap = { _id: pharma._id, email: pharma.email };
        const tokenp = await PharmacienService.generateAccessTokenp(tokenDatap, "secret", "1h");
        res.status(200).json({ status: true, success: "sendData", token: tokenp ,username:pharma.name});
        console.log('login successful');
    } catch (error) {
        console.log(error, 'err---->');
        return res.status(500).json({ status: false, error: "Internal Server Error" });
    }
};
