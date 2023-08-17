const mongoose = require('mongoose');
const db= require('../config/db');
const bcrypt = require('bcrypt');
const crypto = require('crypto');

const {Schema} = mongoose;

const userSchema = new Schema( {
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
    
    resetCode :{
        type:String,
        require:true,
    }
});

// userSchema.pre('save',async function(){
//     try{
//         var user =this ;
//         const salt =await(bcrypt.genSalt(10));
//         const hashpass = await bcrypt.hash(user.password,salt);

//         user.password =hashpass ;
//     }catch(error){
//         throw error;
//     }
// })





// userSchema.pre('save',async function(){
//     try{
//         var user1 =this ;
//         const salt1 =await(bcrypt.genSalt(10));
//         const hashpassconf = await bcrypt.hash(user1.passwordconf,salt1);

//         user1.passwordconf =hashpassconf ;
//     }catch(error){
//         throw error;
//     }
// })

// //used while signIn decrypt
// userSchema.methods.comparePassword = async function (candidatePassword) {
//     try {
//         console.log('----------------no password',this.password);
//         // @ts-ignore
//         const isMatch = await bcrypt.compare(candidatePassword, this.password);
//         return isMatch;
//     } catch (error) {
//         throw error;
//     }
// };


const ENCRYPTION_KEY = 'chadha'; // Replace with a strong and secure encryption key

function encrypt(text) {
    const cipher = crypto.createCipher('aes-256-cbc', ENCRYPTION_KEY);
    let encrypted = cipher.update(text, 'utf8', 'hex');
    encrypted += cipher.final('hex');
    return encrypted;
}

function decrypt(encryptedText) {
    const decipher = crypto.createDecipher('aes-256-cbc', ENCRYPTION_KEY);
    let decrypted = decipher.update(encryptedText, 'hex', 'utf8');
    decrypted += decipher.final('utf8');
    return decrypted;
}


userSchema.pre('save', function () {
    if (this.isModified('password')) {
        this.password = encrypt(this.password);
    }
    if (this.isModified('passwordconf')) {
        this.passwordconf = encrypt(this.passwordconf);
    }
    
});


userSchema.methods.comparePassword = function (candidatePassword) {
    try {
        const decryptedPassword = decrypt(this.password);

        return candidatePassword === decryptedPassword;
    } catch (error) {
        throw error;
    }
};

userSchema.methods.decrypted = function (Text) {
    return decrypt(Text);
};



const UserModel = db.model('User', userSchema);

module.exports = UserModel;