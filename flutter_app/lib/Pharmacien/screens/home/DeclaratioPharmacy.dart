import 'package:flutter/material.dart';
import '../../../config.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DeclaratioPharmacy extends StatefulWidget {
  @override
  _DeclaratioPharmacyState createState() => _DeclaratioPharmacyState();
}

class _DeclaratioPharmacyState extends State<DeclaratioPharmacy> {
  TextEditingController _nameController = TextEditingController();

  Future<void> register() async {
    if (_nameController.text.isNotEmpty) {
      var regBody = {"Name_medicament": _nameController.text};

      var response = await http.post(
        Uri.parse(repture_pharmacy),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(regBody),
      );

      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);
        //print(jsonResponse['status']);
        Navigator.pop(context);
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
          'Declarer,Rupture de stock',
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
              'Noms du medicament:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(
                hintText: 'Entrer le medicament ',
              ),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                register();
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