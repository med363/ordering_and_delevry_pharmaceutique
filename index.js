const express = require('express');
const app = express();
const db = require('./config/db');
const body_parseer =require('body-parser');
const userRouter = require('./routers/user.router')
const UserModel = require('./model/user');
const PharamacienRouter = require('./routers/pharmacien.route')
const PharamacienModel = require('./model/pharmacien');
const cors = require('cors');

app.use(cors());
const http = require('http');
const server = http.createServer(app)

const io = require('socket.io')(server);



app.use(body_parseer.json());
app.use('/',userRouter);
app.use('/',PharamacienRouter);
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