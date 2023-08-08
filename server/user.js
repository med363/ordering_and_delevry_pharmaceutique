const mongoose = require('mongoose');
const db= require('../config/db');
const bcrypt = require('bcrypt');

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
    }
});

userSchema.pre('save',async function(){
    try{
        var user =this ;
        const salt =await(bcrypt.genSalt(10));
        const hashpass = await bcrypt.hash(user.password,salt);

        user.password =hashpass ;
    }catch(error){
        throw error;
    }
})

userSchema.pre('save',async function(){
    try{
        var user1 =this ;
        const salt1 =await(bcrypt.genSalt(10));
        const hashpassconf = await bcrypt.hash(user1.passwordconf,salt1);

        user1.passwordconf =hashpassconf ;
    }catch(error){
        throw error;
    }
})

//used while signIn decrypt
userSchema.methods.comparePassword = async function (candidatePassword) {
    try {
        console.log('----------------no password',this.password);
        // @ts-ignore
        const isMatch = await bcrypt.compare(candidatePassword, this.password);
        return isMatch;
    } catch (error) {
        throw error;
    }
};
const UserModel = db.model('User', userSchema);

module.exports = UserModel;