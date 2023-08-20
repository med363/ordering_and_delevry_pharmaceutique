const express = require('express');
const app = express();
const body_parseer =require('body-parser');
const userRouter = require('./routers/user.router')
const PharamacienRouter = require('./routers/pharmacien.route')
const routerMedicament = require('./routers/medicament')

const StockeRouter = require('./routers/stocke.route')
const stockeModel = require('./model/stocke');

const ReptureRouter = require('./routers/repture.route')
const reptureModel = require('./model/repture');

const AchatRouter = require('./routers/achat.route')
const achatModel = require('./model/achat');

const cors = require('cors');

app.use(cors());
const http = require('http');
const server = http.createServer(app)

const io = require('socket.io')(server);



app.use(body_parseer.json());
app.use('/',userRouter);
app.use('/',PharamacienRouter);
app.use('/api',routerMedicament)
app.use('/',StockeRouter);
app.use('/',ReptureRouter);
app.use('/',AchatRouter);
const PharmacyRouter = require('./routers/pharmacy.route')
const phModel = require('./model/pharmacy');
app.use('/',PharmacyRouter );
app.get('/',(req,res)=> {
    res.send("hello world")
    
})
io.on("connection", (socket)=>{
  socket.join("anomynous_group")
  console.log("backend connected");
  socket.on("sendMsg",(msg)=>{
      console.log("msg", msg);
      // socket.emit("sendMsgServer",{...msg, type:"otherMsg"})
      // socket.broadcast.emit("sendMsgServer",{...msg, type:"otherMsg"})
      io.to("anomynous_group").emit("sendMsgServer",{...msg,type:"otherMsg"});
  })
  //....
});
const PORT = process.env.PORT || 3000;
server.listen(PORT, function () {
  console.log('Server is started on http://127.0.0.1:'+PORT);
});

// server.listen(3000)