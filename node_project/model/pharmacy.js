const mongoose = require('mongoose');
const db= require('../config/db');

const {Schema} = mongoose;

const pharmacySchema = new Schema( {
    pharmacyName:{
        type:String,
        require:true, 
    },
    pharmacyLocation:{
        type:String,
        require:true, 
    }

});

pharmacySchema.pre('save', async function (next) {
    try {
        const pharmacy = this;

        if (!pharmacy.isModified('pharmacyLocation')) {
            return next();
        }

    } catch (error) {
        next(error);
    }
});
const phModel = db.model('pharmacie',pharmacySchema);

module.exports = phModel;