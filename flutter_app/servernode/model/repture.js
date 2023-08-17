const mongoose = require('mongoose');
const db= require('../config/db');

const {Schema} = mongoose;

const reptureSchema = new Schema( {
    Name_medicament:{
        type:String,
        require:true, 
    }
});

reptureSchema.pre('save', async function (next) {
    try {
        const repture = this;

        if (!repture.isModified('Name_medicament')) {
            return next();
        }

    } catch (error) {
        next(error);
    }
});
const reptureModel = db.model('Repture',reptureSchema);

module.exports = reptureModel;