import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AddMedicationPage extends StatefulWidget {
  @override
  _AddMedicationPageState createState() => _AddMedicationPageState();
}

class _AddMedicationPageState extends State<AddMedicationPage> {
  // Create TextEditingController for form fields
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _dosageController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _manufacturerController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController(); // New controller for quantity

  @override
  void dispose() {
    // Clean up the controllers when the page is disposed
    _nameController.dispose();
    _dosageController.dispose();
    _descriptionController.dispose();
    _manufacturerController.dispose();
    _priceController.dispose();
    _quantityController.dispose(); // Dispose the new controller
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '💊 Ajouter des Médicaments 💊',
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
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Nom du médicament'),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: _dosageController,
              decoration: InputDecoration(labelText: 'Dosage'),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: _descriptionController,
              decoration: InputDecoration(labelText: 'Description'),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: _manufacturerController,
              decoration: InputDecoration(labelText: 'Fabricant'),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: _priceController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Prix'),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: _quantityController, // Use the new controller for quantity
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Quantité'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                // Handle form submission and add the medication
                String medicationName = _nameController.text;
                String medicationDosage = _dosageController.text;
                String medicationDescription = _descriptionController.text;
                String medicationManufacturer = _manufacturerController.text;
                String medicationPrice = _priceController.text;
                int medicationQuantity = int.tryParse(_quantityController.text) ?? 0; // Get quantity value

                // Create a map of medication data
                Map<String, dynamic> medicationData = {
                  'name': medicationName,
                  'dosage': medicationDosage,
                  'description': medicationDescription,
                  'fabricant': medicationManufacturer,
                  'prix': medicationPrice,
                  'quantite': medicationQuantity, // Include quantity in the data
                };

                // Convert the medicationData map to a JSON string
                String jsonData = jsonEncode(medicationData);

                // Perform the API call to post medication data to the server
                final response = await http.post(
                  Uri.parse('http://127.0.0.1:3000/api/create'),
                  headers: {"Content-Type": "application/json"},
                  body: jsonData,
                );

                  if (response.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Medication added successfully'),
          backgroundColor: Colors.green,
        ),
      );
      Navigator.pop(context,true); // Navigate back after showing SnackBar
    } else {
                  // Handle API error, you can show an error message or take appropriate action
                  debugPrint('API Error: ${response.body}');
                }
                print('Response Status Code: ${response.statusCode}');
                print('Response Body: ${response.body}');
              },
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 21, 228, 66),
              ),
              child: Text('Ajouter'),
            ),
          ],
        ),
      ),
    );
  }
}