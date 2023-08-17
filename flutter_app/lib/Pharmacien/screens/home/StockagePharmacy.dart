import 'package:flutter/material.dart';
import '../../../config.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class StockagePharmacy extends StatefulWidget {
  @override
  _StockagePharmacyState createState() => _StockagePharmacyState();
}

class _StockagePharmacyState extends State<StockagePharmacy> {
  TextEditingController _namestockeController = TextEditingController();
  TextEditingController _nbrstockeController = TextEditingController();

  Future<void> register() async {
    if (_namestockeController.text.isNotEmpty &&
        _nbrstockeController.text.isNotEmpty) {
      var regBody = {
        "Name_stocke": _namestockeController.text,
        "quantite_stocke": _nbrstockeController.text,
      };

      var response = await http.post(
        Uri.parse(stocke_pharmacy),
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
          'stocker les produits pharmaceutiques',
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
              controller: _namestockeController,
              decoration: InputDecoration(
                hintText: 'Entrer la nouvelle medicament ',
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Quantite:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextFormField(
              controller: _nbrstockeController,
              decoration: InputDecoration(
                hintText: 'Entrer les Nombres',
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
