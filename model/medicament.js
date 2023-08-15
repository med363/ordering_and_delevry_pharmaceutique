const mongoose = require('mongoose');
const db= require('../config/db');

const {Schema} = mongoose;

const medicamentSchema = new Schema( {
    name:{
        type:String,
        require:true, 
    },
    dosage:{
        type:String,
        require:true, 
    },
	description:{
        type:String,
        require:true
    },
    fabricant:{
        type:String,
        require:true
    },
    prix:{
        type:String,
        require:true
    },
    quantite: {
        type: Number,
        default: 1,
    },
 

});

const medicamentModel = db.model('medicament', medicamentSchema);

module.exports = medicamentModel;