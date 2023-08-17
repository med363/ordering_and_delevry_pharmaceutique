const mongoose = require('mongoose');
const db= require('../config/db');

const {Schema} = mongoose;

const achatSchema = new Schema( {
    noms:{
        type:String,
        require:true, 
    },
    type:{
        type:String,
        require:true, 
    },
    Number:{
        type:String,
        require:true, 
    },
    prix:{
        type:String,
        require:true, 
    },
    codeinternet:{
        type:String,
        require:true, 
    },
    patient:{
        type:String,
        require:true, 
    },
    ordonnance:{
        type:String,
        require:true, 
    }
});

achatSchema.pre('save', async function (next) {
    try {
        const achat = this;

        if (achat.isModified('type') ) {
           
        } {
            return next();
        }

    } catch (error) {
        next(error);
    }
});
const achatModel = db.model('Achat',achatSchema);

module.exports = achatModel;