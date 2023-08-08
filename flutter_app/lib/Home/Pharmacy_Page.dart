import 'package:flutter/material.dart';
import 'package:flutter_app/Home/HomePage.dart';
import 'package:search_map_location/search_map_location.dart';
class PharmacyPage extends StatefulWidget {
  const PharmacyPage({super.key});

  @override
  State<PharmacyPage> createState() => _PharmacyPageState();
}

class _PharmacyPageState extends State<PharmacyPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              icon: Row(
                
                children: [
                  Icon(Icons.arrow_back),
                  Image.asset(
                    "assets/images/pharmacie.png",
                    width: 40, // Set your desired width
                    height: 40, // Set your desired height
                  ),
                  SizedBox(
                      width: 8), // Add some spacing between the image and text
                  Text(
                    'Pharmacie',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
              ),
        ),
        body: Column(
          children: [
             Container(
            padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
            child: Text(
                  'Choisis la pharmacie prés de vous',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
            ),
<<<<<<< HEAD
      Container(
            padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
            child: Column(
              children: [
              // SearchLocation(
              //         apiKey: '$placeApiKey', // YOUR GOOGLE MAPS API KEY
              //         country: 'TN',
              //         onSelected: (Place place){
              //            _address=place.description;

              //         },
              // )
              // decoration: InputDecoration(
              //   prefixIcon: Icon(Icons.search),
              //   hintText: 'Rechercher des médicaments...',
              // ),
              ],
              

=======
        Container(
          padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
          child: TextField(
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.search),
              suffixIcon: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(Icons.camera_alt),
                    onPressed: () {
                      // Action lors du clic sur l'icône de l'appareil photo/vidéo
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.mic),
                    onPressed: () {
                      // Action lors du clic sur l'icône de la voix
                    },
                  ),
                ],
              ),
              hintText: 'Rechercher des médicaments...',
>>>>>>> chadha
            ),
          )
        ],
      ),
    );
  }
}






