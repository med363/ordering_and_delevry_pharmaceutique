import 'package:flutter/material.dart';

class StockagePharmacy extends StatefulWidget {
  @override
  _StockagePharmacyState createState() =>
      _StockagePharmacyState();
}

class _StockagePharmacyState
    extends State<StockagePharmacy> {
  TextEditingController _locationController = TextEditingController();
  TextEditingController _nameController = TextEditingController();

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
              controller: _locationController,
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
              controller: _nameController,
              decoration: InputDecoration(
                hintText: 'Entrer les Nombres',
              ),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                // Handle the form submission and update the pharmacy location and name
                String newLocation = _locationController.text;
                String newName = _nameController.text;
                // Update the pharmacy location and name logic here

                // Navigate back to the previous screen
                Navigator.pop(context);
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
