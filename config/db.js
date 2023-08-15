const mongoose = require ('mongoose');

const connection = mongoose.createConnection('mongodb://127.0.0.1:27017/pixemantic').on('open',()=>{
    console.log("Mongodb conncted");
}).on('error',()=>{
console.log("Mongodb connction error");
});
module.exports = connection;
