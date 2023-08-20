import 'dart:html';

import 'package:flutter/material.dart';
import '../../../config.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ModifyPharmacyLocationPage extends StatefulWidget {
  @override
  _ModifyPharmacyLocationPageState createState() =>
      _ModifyPharmacyLocationPageState();
}

class _ModifyPharmacyLocationPageState
    extends State<ModifyPharmacyLocationPage> {
  TextEditingController _locationController = TextEditingController();
  TextEditingController _nameController = TextEditingController();

  Future<void> register() async {
    if (_locationController.text.isNotEmpty &&
        _nameController.text.isNotEmpty) {
      var regBody = {
        "pharmacyName": _locationController.text,
        "pharmacyLocation": _nameController.text,
      };

      var response = await http.post(
        Uri.parse(information_pharmacy),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(regBody),
      );

      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);
         Navigator.pop(context);
        //print(jsonResponse['status']);
          print("bien enregistrer");
      } else {
        print("Something Went Wrong");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green, // Change the AppBar color to green
        title: Text(
          'Modifier Localisation du Pharmacie',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white, // Change the text color to white
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Nouvelle Localisation:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextFormField(
              controller: _locationController,
              decoration: InputDecoration(
                hintText: 'Entrer la nouvelle localisation',
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Nouveau Nom:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(
                hintText: 'Entrer le nouveau nom',
              ),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                register();

                // Navigate back to the previous screen
              
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.green, // Change the button color to green
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                'Valider',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}