import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../Core/Colors/Hex_Color.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //final padding = EdgeInsets.symmetric(horizontal: 20);
  // final GlobalKey<ScaffoldState> _globalKey = GlobalKey();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final List<String> images = [
    'med.png',
    'medicament.png',
    'pharmacie.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        extendBodyBehindAppBar: true, // Important: extend body behind AppBar

        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
          // Set the color of the drawer icon
          leading: IconButton(
            icon: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: SvgPicture.asset(
                'assets/images/menu.svg', // Replace with the path to your SVG file
                width: 24,
                height: 24,
              ),
            ),
            onPressed: () {
              _scaffoldKey.currentState?.openDrawer();
            },
          ),
          actions: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: IconButton(
                icon: Icon(Icons.login),
                onPressed: () {
                Navigator.pushNamed(context, '/login');
                },
              ),
            ),
          ],
        ),
        //inside the body
        body: Stack(children: [
          Container(
            // decoration: BoxDecoration(
            //   gradient: LinearGradient(
            //     begin: Alignment.topLeft,
            //     end: Alignment.bottomRight,
            //     stops: const [0.1, 0.4, 0.7, 0.9],
            //     colors: [
            //       HexColor("#4b4293").withOpacity(0.6),
            //       HexColor("#4b4293").withOpacity(0.6),
            //       HexColor("#08418e"),
            //       HexColor("#08418e")
            //     ],
            //   ),
            //   image: DecorationImage(
            //     fit: BoxFit.cover,
            //     colorFilter: ColorFilter.mode(
            //         HexColor("#fff").withOpacity(0.3), BlendMode.dstATop),
            //     image: AssetImage('assets/images/1.jpg'),
            //   ),
            // ),

            color: Colors.white38,
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
  height: 500,
  child: ListView.builder(
    scrollDirection: Axis.horizontal,
    itemCount: images.length,
    itemBuilder: (context, index) {
      return Container(
        width: 200,
        margin: EdgeInsets.symmetric(horizontal: 8),
        child: Card(
          elevation: 20, // Adjust the elevation value for the shadow effect
          color: Color.fromARGB(255, 128, 130, 173), // Replace with your desired "crystal" color
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  'assets/images/${images[index]}',
                  fit: BoxFit.contain, // Adjust the fit property for resizing the image
                  width: 120, // Adjust the width value as needed
                  height: 120, // Adjust the height value as needed
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Name', // Replace with the actual name
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      );
    },
  ),
),
          Container(
            padding: const EdgeInsets.only(top: 510, left: 10, right: 10),
            child: Column(
              children: [
                Text(
                  "Categories",
                  style: GoogleFonts.oswald(
                      color: Colors.black,
                      fontSize: 32,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
Container(
  padding: const EdgeInsets.only(top: 470, left: 10, right: 10),
  child: ListView.builder(
    itemBuilder: (context, index) {
      return Card(
        elevation: 20,
        color: Color.fromARGB(255, 128, 130, 173), // Replace with your desired "crystal" color
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  'assets/images/med.png', // Replace with the image path
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 120,
                ),
              ),
              SizedBox(height: 8),
              Text(
                "name", // Replace with the product name
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 4),
              Text("price", // Replace with the product price
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      );
    },
  ),
)


        ]),
        drawer: Drawer(
            width: 275,
            elevation: 30,
            backgroundColor: Colors.white,
                child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 50, 20, 20),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).pop(); // Close the drawer
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: const [
                                  Icon(
                                    Icons.arrow_back_ios,
                                    color: Colors.black,
                                    size: 20,
                                  ),
                                  SizedBox(
                                    width: 0,
                                  ),
                                  Text(
                                    'Back ',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            )
                          ]),
                        ]))));
  }


}