import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../Core/Colors/Hex_Color.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //final padding = EdgeInsets.symmetric(horizontal: 20);
  // final GlobalKey<ScaffoldState> _globalKey = GlobalKey();
  final List<String> images = [
    'med.png',
    'medicament.png',
    'pharmacie.png',
  ];
  final List<String> boxColors = [
    'Red',
    'Blue',
    'Green',
    'Yellow',
    'Orange',
    'Purple',
  ];
  @override
  Widget build(BuildContext context) {
        return 
         Scaffold(
        extendBodyBehindAppBar: true, // Important: extend body behind AppBar

        appBar: AppBar(
          

          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
          // Set the color of the drawer icon
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/login');
              },
              child: const Text(
                "Log in",
                style: TextStyle(color: Colors.black),
              ),
            ),
            const Icon(Icons.person)
          ],
        ),
        //inside the body
        body: Stack(children: [
          Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: const [0.1, 0.4, 0.7, 0.9],
            colors: [
              HexColor("#4b4293").withOpacity(0.8),
              HexColor("#4b4293"),
              HexColor("#08418e"),
              HexColor("#08418e")
            ],
          ),
          image: DecorationImage(
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                HexColor("#fff").withOpacity(0.2), BlendMode.dstATop),
            image: AssetImage('assets/images/1.jpg'),
          ),
        ),

            // color: Colors.white,
            // decoration: BoxDecoration(
            //   image: DecorationImage(
            //       imacloge: AssetImage("../../icons/background.jpg"),
            //       fit: BoxFit.cover ))
          ),
          Container(
            padding: const EdgeInsets.only(top: 100, left: 10, right: 10),
            child: Column(
              children: [
                Text(
                  "What you search?",
                  style: GoogleFonts.oswald(
                      color: Colors.black,
                      fontSize: 32,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Container(
              padding: const EdgeInsets.only(top: 160, left: 10, right: 10),
              height: 200, // Adjust the height as needed
              child: ListView.builder(
                  scrollDirection:
                      Axis.horizontal, // Set the scroll direction to horizontal
                  itemCount: images.length,
                  itemBuilder: (context, index) {
                    return Container(
                        width: 150, // Adjust the width as needed
                        margin: EdgeInsets.symmetric(horizontal: 8),
                        color:
                            _getColorByIndex(index), // Get color based on index
                        child: Center(
                            child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            'assets/images/${images[index]}', // Replace with your image path
                            fit: BoxFit.cover,
                          ),
                        )));
                  }))
        ]),
        drawer: Drawer(
            width: 275,
            elevation: 30,
            backgroundColor: Color(0xF3393838),
            shape: const RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.horizontal(right: Radius.circular(30))),
            child: Container(
                decoration: const BoxDecoration(
                    borderRadius:
                        BorderRadius.horizontal(right: Radius.circular(40)),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.white, spreadRadius: 10, blurRadius: 10)
                    ]),
                child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 50, 20, 20),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(children: [
                            Row(
                              children: const [
                                Icon(
                                  Icons.arrow_back_ios,
                                  color: Colors.black,
                                  size: 20,
                                ),
                                SizedBox(
                                  width: 56,
                                ),
                                Text(
                                  'Back ',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 16),
                                ),
                              ],
                            ),
                          ]),
                        ])))));
  }

  _getColorByIndex(int index) {
    List<Color> colors = [
      Colors.red,
      Colors.blue,
      Colors.green,
      Colors.yellow,
      Colors.orange,
      Colors.purple,
    ];
    return colors[index % colors.length];
  }
}
