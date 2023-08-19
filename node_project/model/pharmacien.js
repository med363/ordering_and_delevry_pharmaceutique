const mongoose = require('mongoose');
const db= require('../config/db');
const bcrypt = require('bcrypt');

const {Schema} = mongoose;

const pharmacienSchema = new Schema( {
    name:{
        type:String,
        require:true, 
    },
    phone:{
        type:String,
        require:true, 
    },
	email:{
        type:String,
        lowercase:true,
        require:true,
        unique:true
    },
    password:{
        type:String,
        require:true
    },
    passwordconf:{
        type:String,
        require:true
    },
    profession:{
        type:String,
        require : true
    },
    image: {
        type: String,
        required: true // Add this line
    },
    pharmacyName: {
        type: String, // Add field for pharmacy name
    },
    pharmacyLocation: {
        type: String, // Add field for pharmacy location
    }

});

// ... (other imports and code)
pharmacienSchema.pre('save', async function (next) {
    try {
        const pharma = this;

        if (!pharma.isModified('password')) {
            return next();
        }

        const salt = await bcrypt.genSalt(10);

        try {
            const hashpass = await bcrypt.hash(pharma.password, salt);
            pharma.password = hashpass;
            next();
        } catch (error) {
            console.error('Error hashing password:', error);
            next(error);
        }
    } catch (error) {
        next(error);
    }
});
// ... (rest of the code)

// ... (rest of the code)



pharmacienSchema.methods.comparePassword = async function (candidatePassword) {
    try {
        console.log('----------------no password',this.password);
        // @ts-ignore
        const isMatc = await bcrypt.compare(candidatePassword, this.password);
        return isMatc;
    } catch (error) {
        throw error;
    }
}


const PharmaModel = db.model('Pharamacien', pharmacienSchema);

module.exports = PharmaModel;