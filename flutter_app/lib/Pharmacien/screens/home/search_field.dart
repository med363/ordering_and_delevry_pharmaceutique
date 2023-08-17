import 'dart:developer';
import '../../../config.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'Vente_liste.dart';
import 'add_medication_page.dart';
import 'PharmacyLocationMapScreen.dart';
import 'ModifyPharmacyLocationPage.dart';
import 'DeclaratioPharmacy.dart';
import 'StockagePharmacy.dart';


class Category {
  const Category(this.icon, this.title, this.id);

  final String icon;
  final String title;
  final String id;
}

class Pharmacy {
  String name;
  String location;

  Pharmacy({required this.name, required this.location});
}

final homeCategories = <Category>[
  const Category('assets/icons/med.png', 'Medecin', 'medecin'),
  const Category('assets/icons/pharmacie.png', 'Pharmacie', 'pharmacie'),
  const Category('assets/icons/medicament.png', 'Medicament', 'medicament'),
  const Category('assets/icons/vente.webp', 'Vente', 'vente'),
  const Category('assets/icons/question.png', 'Question', 'question'),
  const Category('assets/icons/category_others@2x.png', 'Others', 'other'),
];

//VenteOptionsPage
class SearchField extends StatelessWidget {
  const SearchField({super.key});

  Future<void> showVenteOptions(BuildContext context) async {
   final response = await http.get(Uri.parse(all_achat));
  
    if (response.statusCode == 200) {
      Map<String, dynamic> achat = jsonDecode(response.body);

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => VenteOptionsPage(achat:achat),
        ),
      );
    } else {
      // Handle error
      print('Failed to fetch stock from the server.');
    }
  }

  void showPharmacyOptions(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: EdgeInsets.all(53), // Padding for the content
          title: Text(
            'Options Pharmacie',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(
                255,
                21,
                228,
                66,
              ), // Green color like pharmacy logo
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ElevatedButton(
                onPressed: () async {
                  log('Modifier Localisation du Pharmacie');
                  Navigator.pop(context); // Close the dialog
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ModifyPharmacyLocationPage(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary:
                      Colors.white, // Use white color for the button background
                  onPrimary: Color.fromARGB(
                      255, 21, 228, 66), // Use the green color for text
                  side: BorderSide(
                      color: Color.fromARGB(255, 21, 228, 66),
                      width: 2), // Add a border to simulate the glass effect
                ),
                child: Text(
                  'Modifier Localisation du Pharmacie',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              SizedBox(height: 15), // Add spacing between buttons
              ElevatedButton(
                onPressed: () {
                  // Handle "Contacter Autre Pharmacie" action here
                  log('stockage pharmaceutique ');
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => StockagePharmacy(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary:
                      Colors.white, // Use white color for the button background
                  onPrimary: Color.fromARGB(
                      255, 21, 228, 66), // Use the green color for text
                  side: BorderSide(
                      color: Color.fromARGB(255, 21, 228, 66),
                      width: 2), // Add a border to simulate the glass effect
                ),
                child: Text(
                  'stockage pharmaceutique ',
                  style: TextStyle(fontSize: 20),
                ),
              ),

              SizedBox(height: 15), // Add spacing between buttons
              ElevatedButton(
                onPressed: () {
                  // Handle "Contacter Autre Pharmacie" action here
                  log('Déclarer une rupture ');
                  Navigator.pop(context);
                 Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DeclaratioPharmacy(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary:
                      Colors.white, // Use white color for the button background
                  onPrimary: Color.fromARGB(
                      255, 21, 228, 66), // Use the green color for text
                  side: BorderSide(
                      color: Color.fromARGB(255, 21, 228, 66),
                      width: 2), // Add a border to simulate the glass effect
                ),
                child: Text(
                  'Déclarer une rupture',
                  style: TextStyle(fontSize: 20),
                ),
              ),

              SizedBox(height: 15),
              // Add spacing between buttons
              ElevatedButton(
                onPressed: () {
                  // Handle "Contacter Délégué" action here
                  log('Contacter Délégué');
                  Navigator.pop(context);
                  // Close the dialog
                },
                style: ElevatedButton.styleFrom(
                  primary:
                      Colors.white, // Use white color for the button background
                  onPrimary: Color.fromARGB(
                      255, 21, 228, 66), // Use the green color for text
                  side: BorderSide(
                      color: Color.fromARGB(255, 21, 228, 66),
                      width: 2), // Add a border to simulate the glass effect
                ),
                child: Text(
                  'Contacter Délégué',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              SizedBox(height: 15), // Add spacing between buttons
              ElevatedButton(
                onPressed: () {
                  // Handle "Contacter Autre Pharmacie" action here
                  log('Contacter Autre Pharmacie');
                  Navigator.pop(context);
                  // Close the dialog
                },
                style: ElevatedButton.styleFrom(
                  primary:
                      Colors.white, // Use white color for the button background
                  onPrimary: Color.fromARGB(
                      255, 21, 228, 66), // Use the green color for text
                  side: BorderSide(
                      color: Color.fromARGB(255, 21, 228, 66),
                      width: 2), // Add a border to simulate the glass effect
                ),
                child: Text(
                  'Contacter Autre Pharmacie',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

// Function to show the medication options dialog
  void showMedicationOptions(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: EdgeInsets.all(53), // Padding for the content
          title: Text(
            'Options Médicament',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(
                  255, 21, 228, 66), // Green color like pharmacy logo
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ElevatedButton(
                onPressed: () {
                  // Handle "Ajouter Médicament" action here
                  log('Ajouter Médicament');
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          AddMedicationPage(), // Navigate to the AddMedicationPage
                    ),
                  ); // Close the dialog
                },
                style: ElevatedButton.styleFrom(
                  primary:
                      Colors.white, // Use white color for the button background
                  onPrimary: Color.fromARGB(
                      255, 21, 228, 66), // Use the green color for text
                  side: BorderSide(
                      color: Color.fromARGB(255, 21, 228, 66),
                      width: 2), // Add a border to simulate the glass effect
                ),
                child: Text(
                  'Ajouter Médicament',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              SizedBox(height: 15), // Add spacing between buttons
              ElevatedButton(
                onPressed: () {
                  // Handle "Modifier Médicament" action here
                  log('Modifier Médicament');
                  Navigator.pop(context);
                  // Close the dialog
                },
                style: ElevatedButton.styleFrom(
                  primary:
                      Colors.white, // Use white color for the button background
                  onPrimary: Color.fromARGB(
                      255, 21, 228, 66), // Use the green color for text
                  side: BorderSide(
                      color: Color.fromARGB(255, 21, 228, 66),
                      width: 2), // Add a border to simulate the glass effect
                ),
                child: Text(
                  'Modifier Médicament',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              SizedBox(height: 15), // Add spacing between buttons
              ElevatedButton(
                onPressed: () {
                  // Handle "Supprimer Médicament" action here
                  log('Supprimer Médicament');
                  Navigator.pop(context); // Close the dialog
                },
                style: ElevatedButton.styleFrom(
                  primary:
                      Colors.white, // Use white color for the button background
                  onPrimary: Color.fromARGB(
                      255, 21, 228, 66), // Use the green color for text
                  side: BorderSide(
                      color: Color.fromARGB(255, 21, 228, 66),
                      width: 2), // Add a border to simulate the glass effect
                ),
                child: Text(
                  'Supprimer Médicament',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              SizedBox(height: 15), // Add spacing between buttons
              ElevatedButton(
                onPressed: () {
                  // Handle "Modifier Médicament" action here
                  log('Liste Médicament');
                  Navigator.pop(context); // Close the dialog
                },
                style: ElevatedButton.styleFrom(
                  primary:
                      Colors.white, // Use white color for the button background
                  onPrimary: Color.fromARGB(
                      255, 21, 228, 66), // Use the green color for text
                  side: BorderSide(
                      color: Color.fromARGB(255, 21, 228, 66),
                      width: 2), // Add a border to simulate the glass effect
                ),
                child: Text(
                  'Liste medicament',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

// Function to show the medication options dialog
  void showMedecinOptions(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: EdgeInsets.all(53), // Padding for the content
          title: Text(
            'Options Medecin',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(
                  255, 21, 228, 66), // Green color like pharmacy logo
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ElevatedButton(
                onPressed: () {
                  // Handle "Ajouter Médicament" action here
                  log('Contacter Medecin');
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  primary:
                      Colors.white, // Use white color for the button background
                  onPrimary: Color.fromARGB(
                      255, 21, 228, 66), // Use the green color for text
                  side: BorderSide(
                      color: Color.fromARGB(255, 21, 228, 66),
                      width: 2), // Add a border to simulate the glass effect
                ),
                child: Text(
                  'Contacter Medecin',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              SizedBox(height: 15), // Add spacing between buttons
              ElevatedButton(
                onPressed: () {
                  // Handle "Modifier Médicament" action here
                  log('Rechercher Medecin');
                  Navigator.pop(context);
                  // Close the dialog
                },
                style: ElevatedButton.styleFrom(
                  primary:
                      Colors.white, // Use white color for the button background
                  onPrimary: Color.fromARGB(
                      255, 21, 228, 66), // Use the green color for text
                  side: BorderSide(
                      color: Color.fromARGB(255, 21, 228, 66),
                      width: 2), // Add a border to simulate the glass effect
                ),
                child: Text(
                  'Rechercher Medecin',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      centerTitle: true,
      actions: [
        // Wrap the SingleChildScrollView and SearchField in a Row
        Row(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: homeCategories.map((category) {
                  return InkWell(
                    onTap: () {
                      if (category.id == 'medicament') {
                        // Show the medication options dialog
                        showMedicationOptions(context);
                      } else if (category.id == 'pharmacie') {
                        // Show the pharmacy options dialog
                        showPharmacyOptions(context);
                      } else if (category.id == 'medecin') {
                        // Show the pharmacy options dialog
                        showMedecinOptions(context);
                      } else if (category.id == 'vente') {
                        // Show the pharmacy options dialog
                        showVenteOptions(context);
                      } else {
                        log('Selected category: ${category.title}');
                      }
                    },
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      child: Row(
                        children: [
                          Image.asset(
                            category.icon,
                            width: 24,
                            height: 24,
                          ),
                          SizedBox(width: 10),
                          Text(
                            category.title,
                            style: TextStyle(
                              color:
                                  Colors.black, // Set the text color to black
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            // Add the search bar TextField here
          ],
        ),
      ],
    );
  }
}
