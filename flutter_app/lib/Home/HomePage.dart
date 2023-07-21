import 'dart:js';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class CardItem {
  final Icon AwesomeIcons;
  final String title;
  final Color iconColor;


  const CardItem({
    required this.AwesomeIcons,
    required this.title,
    required this.iconColor
  });
}

class _HomePageState extends State<HomePage> {
  //final padding = EdgeInsets.symmetric(horizontal: 20);
  // final GlobalKey<ScaffoldState> _globalKey = GlobalKey();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  List<CardItem> item = [
    CardItem(AwesomeIcons: Icon(FontAwesomeIcons.medkit), title: "Pharmacie",iconColor: Colors.blue),
    CardItem(AwesomeIcons: Icon(FontAwesomeIcons.pills), title: "Medication",iconColor: Colors.green),
    CardItem(AwesomeIcons: Icon(FontAwesomeIcons.question), title: "Question",iconColor: Colors.orange),
    CardItem(AwesomeIcons: Icon(FontAwesomeIcons.magento), title: "Magazins",iconColor: Colors.red),
  ];
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

            color: Colors.transparent,
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
            padding: const EdgeInsets.only(top: 160, left: 1, right: 10),

            height: 250, // Set the desired height of the scrolling area
            child: ListView.separated(
                padding: EdgeInsets.all(16),
                scrollDirection:
                    Axis.horizontal, // Set the scroll direction to horizontal
                itemCount:item.length,
                separatorBuilder: (context, index) => SizedBox(
                      width: 12,
                    ),
                itemBuilder: (context, index) => buildCard(context,item: item[index])

                //   Padding(
                //     padding: EdgeInsets.all(8.0),
                //     child:

                //       GestureDetector(
                //       onTap: () {
                //         // Add your logic here for when the pharmacy icon is pressed
                //         print('Pharmacy Icon Pressed!');
                //       },
                //       child: Icon(FontAwesomeIcons.medkit, size: 48, color: Colors.blue),

                //     ),

                //   ),

                //   Padding(
                //     padding: EdgeInsets.all(8.0),
                //     child: GestureDetector(
                //       onTap: () {
                //         // Add your logic here for when the medication icon is pressed
                //        //Navigator.push(context, MaterialPageRoute(builder: (context) => QuestionsPage()));

                //         print('Medication Icon Pressed!');
                //       },
                //       child: Icon(FontAwesomeIcons.pills, size: 48, color: Colors.green),
                //     ),
                //   ),
                //   Padding(
                //     padding: EdgeInsets.all(8.0),
                //     child: GestureDetector(
                //       onTap: () {
                //         // Add your logic here for when the medication icon is pressed
                //        //Navigator.push(context, MaterialPageRoute(builder: (context) => QuestionsPage()));

                //         print('Medication Icon Pressed!');
                //       },
                //       child: Icon(FontAwesomeIcons.question, size: 48, color: Colors.orange),
                //     ),

                //   ),
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
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 510, left: 10, right: 10),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
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
              // scrollDirection: Axis.horizontal,

              itemBuilder: (context, index) {
                return Card(
                  elevation: 20,
                  color: Color.fromARGB(255, 255, 255, 255).withOpacity(
                      0.6), // Replace with your desired "crystal" color
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
                        Text(
                          "price", // Replace with the product price
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

Widget buildCard(BuildContext context,{required CardItem item}) => Container(
      width: 100,
      color: Colors.white,
      child: GestureDetector(
          child: Column(children: [
        Expanded(
          child: AspectRatio(
              aspectRatio: 4 / 3,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(40),
                  child: InkWell(
        onTap: () {
          // Navigate to the corresponding page based on the tapped icon
          switch (item.AwesomeIcons) {
            case FontAwesomeIcons.medkit:
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PharmacyPage(), // Replace with your desired page
                ),
              );
              break;
            case FontAwesomeIcons.pills:
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MedicationPage(), // Replace with your desired page
                ),
              );
              break;
            case FontAwesomeIcons.question:
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => QuestionPage(), // Replace with your desired page
                ),
              );
              break;
            case FontAwesomeIcons.magento:
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MagazinsPage(), // Replace with your desired page
                ),
              );
              break;
            default:
              // Do nothing if no matching icon is found
              break;
          }
        },
                    child: Ink(child: 
                     item.AwesomeIcons
                    ),
                  ))),
        ),
                const SizedBox(
          height: 10,
        ),
        Text(item.title)

      ],
      
      ),
      
      ),
      
    );


// Replace these with your desired destination pages
class PharmacyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pharmacy Page"),
      ),
      body: Center(
        child: Text("This is the Pharmacy Page."),
      ),
    );
  }
}

class MedicationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Medication Page"),
      ),
      body: Center(
        child: Text("This is the Medication Page."),
      ),
    );
  }
}

class QuestionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Question Page"),
      ),
      body: Center(
        child: Text("This is the Question Page."),
      ),
    );
  }
}

class MagazinsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Magazins Page"),
      ),
      body: Center(
        child: Text("This is the Magazins Page."),
      ),
    );
  }
}

