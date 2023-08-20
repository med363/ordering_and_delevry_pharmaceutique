const AchatService= require('../services/achat.services')
const nodemailer = require('nodemailer');
const jwt = require("jsonwebtoken")
exports.register = async (req, res, next) => {
    try {
        
        const {noms,type,Number,prix,patient,ordonnance} = req.body;
        const successRes = await AchatService.AchatPharmacy(
            noms,type,Number,prix,patient,'ordonnance/' + req.file.filename,
        );
        
        // const transporter = nodemailer.createTransport({
        //     service: 'gmail',
        //     auth: {
        //         user: 'chadhajamel47@gmail.com',
        //         pass: 'fgmeplraufkzgrnh'
        //     }
        // });
        // const mailOptions = {
        //     from: "chadhajamel47@gmail.com",
        //     to:patient, // Supposons que l'adresse e-mail du patient est disponible dans req.body ou ailleurs
        //     subject: "Confirmation d'achat dans la pharmacie",
        //     html: `
        //       <h1>Confirmation d'achat</h1>
        //       <p>Bonjour ${patient},</p>
        //       <p>Votre achat a été enregistré avec succès.</p>
        //       <p>Détails de l'achat :</p>
        //       <p>Nom: ${noms}</p>
        //       <p>Prix: ${prix}</p>
        //       <p>Nombre: ${Number}</p>
        //       <p>Merci de votre confiance !</p>
        //     `,
        //   };
        //   await transporter.sendMail(mailOptions);
          
          res.json({ status: true, success: "Achat user Register successfully" });
      
    } catch (error) {
        throw error;
    }
}

exports.getAllachat = async (req, res, next) => {
    try {
        const al = await AchatService.getAllachat();
        res.json({ status: true, achat: al });
    } catch (error) {
        throw error;
    }
}