const express = require('express');
const app = express();
const db = require('./config/db');
const body_parseer =require('body-parser');
const userRouter = require('./routers/user.router')
const UserModel = require('./model/user');
const PharamacienRouter = require('./routers/pharmacien.route')
const PharamacienModel = require('./model/pharmacien');

const PharmacyRouter = require('./routers/pharmacy.route')
const phModel = require('./model/pharmacy');

const StockeRouter = require('./routers/stocke.route')
const stockeModel = require('./model/stocke');

const ReptureRouter = require('./routers/repture.route')
const reptureModel = require('./model/repture');

const AchatRouter = require('./routers/achat.route')
const achatModel = require('./model/achat');


const cors = require('cors');

app.use(cors());


app.use(body_parseer.json());
app.use('/', userRouter);
app.use('/',PharmacyRouter );
app.use('/',PharamacienRouter);
app.use('/',StockeRouter);
app.use('/',ReptureRouter);
app.use('/',AchatRouter);

app.get('/',(req,res)=> {
    res.send("hello world")
})
const PORT = process.env.PORT || 3000;
app.listen(PORT, function () {
  console.log('Server is started on http://127.0.0.1:'+PORT);
});
