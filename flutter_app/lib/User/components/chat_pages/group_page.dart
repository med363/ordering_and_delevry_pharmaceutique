import 'package:flutter/material.dart';
import 'package:flutter_app/Core/Colors/Hex_Color.dart';
import 'package:flutter_app/user/components/chat_pages/msg_model.dart';
import 'package:flutter_app/user/components/chat_pages/pages/other_msg_widget.dart';
import 'package:flutter_app/user/components/chat_pages/pages/own_msg_widget.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class GroupPage extends StatefulWidget {
  final String username;
  final String userId;

  GroupPage({Key? key, required this.userId, required this.username})
      : super(key: key);

  @override
  State<GroupPage> createState() => _GroupPageState();
}

class _GroupPageState extends State<GroupPage> {
  IO.Socket? socket;
  List<MsgModel> listMsg = [];
  TextEditingController _msgController = TextEditingController();

  @override
  void initState() {
    super.initState();
    connect();
  }

  void connect() {
    // Dart client
    socket = IO.io('http://127.0.0.1:3000', <String, dynamic>{
      "transports": ["websocket"],
      "autoConnect": false,
    });
    socket!.connect();
    socket!.onConnect((_) {
      print('Connected to the frontend');
      socket!.on("sendMsgServer", (msg) {
        print(msg);
                    // String sender = msg["senderName"] == widget.username ? "Vous" : msg["senderName"];
      String sender = msg["senderName"] ;
            String msgContent = msg["msg"];

      // if(sender== widget.username){
      //   sender = "";
      // }

if (sender != widget.username) {
          setState(() {
            listMsg.add(
              MsgModel(
                msg: msg["msg"],
                type: msg["type"],
                Sender: sender,
              ),
            );
          }
          );
        }
// else{
//           // Check if the message already exists in the list
//   bool messageExists = listMsg.any((existingMsg) =>
//       existingMsg.msg == msg["msg"] &&
//       existingMsg.type == msg["type"] &&
//       existingMsg.Sender == sender);
//       if (!messageExists) {
//           setState(() {
//             listMsg.add(
//               MsgModel(
//                 msg: msg["msg"],
//                 type: msg["type"],
//                 Sender: sender,
//               ),
//             );
//           }
//           );
//         }

//         }


      }
      );
    }
    );
  }

  void sendMsg(String msg, String senderName) {
    MsgModel ownMsg = MsgModel(msg: msg, type: "ownMsg", Sender: "Vous");
    listMsg.add(ownMsg);
    setState(() {});
    socket!.emit("sendMsg", {
      "type": "ownMsg",
      "msg": msg,
      "senderName": senderName,
      "userId": widget.userId,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Chats",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
            color: Colors.black,
          ),
        ),
        backgroundColor: HexColor("#6FB9EE"),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: const [0.1, 0.4, 0.7, 0.9],
            colors: [
              HexColor("#6FB9EE").withOpacity(0.8),
              HexColor("#6FB9EE"),
              HexColor("#6FB9EE"),
              HexColor("#6FB9EE"),
            ],
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: listMsg.length,
                itemBuilder: (context, index) {
                  if (listMsg[index].type == "ownMsg") {
                    return OwnMsgWidget(
                      msg: listMsg[index].msg,
                      sender: listMsg[index].Sender,
                    );
                  } else {
                    return OtherMsgWidget(
                      msg: listMsg[index].msg,
                      sender: listMsg[index].Sender,
                    );
                  }
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _msgController,
                      decoration: InputDecoration(
                        hintText: "Type here ...",
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          borderSide: BorderSide(
                            width: 2,
                          ),
                        ),
                        suffixIcon: IconButton(
                          onPressed: () {
                            String msg = _msgController.text;
                            if (msg.isNotEmpty) {
                              sendMsg(msg, widget.username);
                              _msgController.clear();
                            }
                          },
                          icon: Icon(
                            Icons.send,
                            color: Colors.teal,
                            size: 26,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
