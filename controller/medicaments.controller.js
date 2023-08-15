// module.exports = {
//     GetProducts: (req, res) => {
//       res.send("Products work");
//     },
//     GetProductsByID: (req, res) => {
//       res.send("Products work by id ");
//     },
//     AddProducts: (req, res) => {
//       res.send("post product work");
//     },
//   };
// les methode CRUD que on veut appeller

const { ServerHeartbeatSucceededEvent } = require('mongodb')
const Medicament = require('../model/medicament')

// create and save new medication
exports.create = async (req, res) => {
    try {
        const { name, dosage } = req.body;

        let medicament = await Medicament.findOne({ name, dosage });

        if (medicament) {
            // If medication with the same name and dosage exists, update the quantity
            medicament.quantite += req.body.quantite || 1; // Add the new quantity or default to 1
            await medicament.save();
        } else {
            // If medication doesn't exist, create a new one
            medicament = new Medicament({
                name: req.body.name,
                dosage: req.body.dosage,
                description: req.body.description,
                fabricant: req.body.fabricant,
                prix: req.body.prix,
                quantite: req.body.quantite || 1, // Add the new quantity or default to 1
            });

            await medicament.save();
        }

        return res.status(201).json(medicament);
    } catch (error) {
        console.error(error);
        return res.status(500).send({ message: "Something went wrong when creating medication" });
    }
};
//get all medications
exports.getAll=(req, res) => {
    Medicament.find().then(data => res.send(data)).catch(err => {
            res.status(500).send({ message: err.message || "something wrong when search medicals" })
        })
    }
//get one medication
exports.getOne=(req, res) => {
    Medicament.findOne(
        {_id: req.params.id}
    ).then(data => res.send(data)).catch(err => {
            res.status(500).send({ message: err.message || "something wrong when DELETE medicals" })
        })
    }

//update one medication
exports.updateMedication=(req, res) => {
    Medicament.findOneAndUpdate(
        {_id: req.params.id},
        req.body,
        {new : true}
    ).then(data => res.send(data)).catch(err => {
            res.status(500).send({ message: err.message || "something wrong when UPDATE medicals" })
        })
    }
//delete one medication
exports.deleteMedication=(req, res) => {
    Medicament.findOneAndDelete(
        {_id: req.params.id}
    ).then(data => res.send(data)).catch(err => {
            res.status(500).send({ message: err.message || "something wrong when DELETE medicals" })
        })
    }
