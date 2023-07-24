import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter_app/Home/Pharmacy_Page.dart';
import 'package:flutter_app/Home/Medication_Page.dart';
import 'package:flutter_app/Home/Magazin_Page.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'Carossel/caroussel.dart';
import 'Question_Page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}



class _HomePageState extends State<HomePage> {

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        extendBodyBehindAppBar: false, // Important: extend body behind AppBar

        appBar: AppBar(
          backgroundColor: Colors.blue,
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
                icon: Icon(Icons.person),
                onPressed: () {
                  Navigator.pushNamed(context, '/login');
                },
              ),
            ),
          ],
        ),
        //inside the body
        body: SingleChildScrollView(
          child: Column(
          children: [
          Container(


            color: Colors.transparent,
          ),
Container(
  padding: const EdgeInsets.only(top: 20, left: 20, right: 0),
  child: Align(
    alignment: Alignment.centerLeft,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "What you search?",
          style: GoogleFonts.oswald(
            color: Colors.black,
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
  ),
),

          Container(
            padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
            height: 200, // Set the desired height of the scrolling area
            child: ListView(
      scrollDirection: Axis.horizontal,
      children: [
        Card(
          shadowColor: Colors.black,
          elevation: 9,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          color: Colors.white,
          child: Container(
            padding: EdgeInsets.all(10.0),
            width: 150,
            height: 250,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                child: Image.asset("assets/images/pharmacie.png",
                width: 400,
                height: 120,),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context)=> PharmacyPage()));
                },
                ),
                SizedBox(height: 10,),
                                          Text(
            "Pharmacy",
                        textAlign: TextAlign.center, // Center text horizontally

            style: GoogleFonts.oswald(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
                
  
              ],
            ),
          ),
        ),
                SizedBox(width: 10), 

                

        Card(
          shadowColor: Colors.black,
          elevation: 9,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          color: Colors.white,
          child: Container(
            padding: EdgeInsets.all(10.0),
            width: 150,
            height: 250,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                GestureDetector(
                child: Image.asset("assets/images/medicament.png",
                width: 400,
                height: 120,),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context)=> MedicationPage()));
                },
                ),
                SizedBox(height: 8,),
                                          Text(
            "Medication",
                        textAlign: TextAlign.center, // Center text horizontally

            style: GoogleFonts.oswald(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
                           ],
            ),
          ),
        ),
                SizedBox(width: 10), // Add space between cards

        Card(
          shadowColor: Colors.black,
          elevation: 9,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          color: Colors.white,
          child: Container(
            padding: EdgeInsets.all(10.0),
            width: 150,
            height: 200,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
  GestureDetector(
                child: Image.asset("assets/images/question.jpg",
                width: 400,
                height: 120,),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context)=> QuestionPage()));
                },
                ),
                SizedBox(height: 10,),
                                          Text(
            "Question",
                        textAlign: TextAlign.center, // Center text horizontally

            style: GoogleFonts.oswald(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
              ],
            ),
          ),
        ),
                SizedBox(width: 10), // Add space between cards

        Card(
          shadowColor: Colors.black,
          elevation: 9,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          color: Colors.white,
          child: Container(
            padding: EdgeInsets.all(10.0),
            width: 150,
            height: 200,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
  GestureDetector(
                child: Image.asset("assets/images/med.png",
                  width: 400,
                height: 120,),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context)=> MagazinPage()));
                },
                ),
                SizedBox(height: 10,),
                                          Text(
            "Magazin",
                        textAlign: TextAlign.center, // Center text horizontally

            style: GoogleFonts.oswald(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),              ],
            ),
          ),
        ),
      ],
    )

          ),
              Container(
  padding: const EdgeInsets.only(top: 20, left: 20, right: 10),
  child: Align(
    alignment: Alignment.centerLeft,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Magazin",
          style: GoogleFonts.oswald(
            color: Colors.black,
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
  ),
),


         Container(
  padding: const EdgeInsets.only(top: 20, left: 0, right: 10),

  child: Column(
    children: [
      DestinationCarousel(),
      
    ],
  ),
),
Container(
  padding: const EdgeInsets.only(top: 20, left: 0, right: 10),

  child: Column(
    children: [
      DestinationCarousel(),
      
    ],
  ),
),

         
          // Container(
          //   padding: const EdgeInsets.only(top: 510, left: 20, right: 10),
          //   child: Column(
          //     // mainAxisAlignment: MainAxisAlignment.center,
          //     children: [
          //       Text(
          //         "Categories",
          //         style: GoogleFonts.oswald(
          //             color: Colors.black,
          //             fontSize: 32,
          //             fontWeight: FontWeight.bold),
          //       ),
          //     ],
          //   ),
          // ),
          // Container(
          //   padding: const EdgeInsets.only(top: 470, left: 10, right: 10),
          //   child: ListView.builder(
          //     // scrollDirection: Axis.horizontal,

          //     itemBuilder: (context, index) {
          //       return Card(
          //         elevation: 20,
          //         color: Color.fromARGB(255, 255, 255, 255).withOpacity(
          //             0.6), // Replace with your desired "crystal" color
          //         shape: RoundedRectangleBorder(
          //           borderRadius: BorderRadius.circular(8),
          //         ),
          //         child: Padding(
          //           padding: const EdgeInsets.all(8.0),
          //           child: Column(
          //             crossAxisAlignment: CrossAxisAlignment.start,
          //             children: [
          //               ClipRRect(
          //                 borderRadius: BorderRadius.circular(8),
          //                 child: Image.asset(
          //                   'assets/images/med.png', // Replace with the image path
          //                   fit: BoxFit.cover,
          //                   width: double.infinity,
          //                   height: 120,
          //                 ),
          //               ),
          //               SizedBox(height: 8),
          //               Text(
          //                 "name", // Replace with the product name
          //                 style: TextStyle(
          //                   fontSize: 16,
          //                   fontWeight: FontWeight.bold,
          //                 ),
          //               ),
          //               SizedBox(height: 4),
          //               Text(
          //                 "price", // Replace with the product price
          //                 style: TextStyle(
          //                   fontSize: 14,
          //                   color: Colors.grey,
          //                 ),
          //               ),
          //             ],
          //           ),
          //         ),
          //       );
          //     },
          //   ),
          // )
        ]
        ),),
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
                    ]
                    )
                    )
                    )
                    );
  }
}


