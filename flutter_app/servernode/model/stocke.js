const mongoose = require('mongoose');
const db= require('../config/db');

const {Schema} = mongoose;

const stockeSchema = new Schema( {
    Name_stocke:{
        type:String,
        require:true, 
    },
   quantite_stocke:{
        type:String,
        require:true, 
    }

});

stockeSchema.pre('save', async function (next) {
    try {
        const stocke = this;

        if (!stocke.isModified('Name_stocke')) {
            return next();
        }

    } catch (error) {
        next(error);
    }
});
const stockeModel = db.model('Stocke',stockeSchema);

module.exports = stockeModel;