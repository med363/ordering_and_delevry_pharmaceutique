import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ModifyMedicalPage extends StatefulWidget {
  final dynamic medicalData;

  const ModifyMedicalPage({Key? key, required this.medicalData})
      : super(key: key);

  @override
  _ModifyMedicalPageState createState() => _ModifyMedicalPageState();
}

class _ModifyMedicalPageState extends State<ModifyMedicalPage> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _dosageController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  TextEditingController _manufacturerController = TextEditingController();
  TextEditingController _priceController = TextEditingController();
  TextEditingController _quantityController = TextEditingController(); // New controller for quantity

  @override
  void initState() {
    super.initState();
    // Initialize text fields with existing data
    _nameController.text = widget.medicalData['name'] ?? '';
    _dosageController.text = widget.medicalData['dosage'] ?? '';
    _descriptionController.text = widget.medicalData['description'] ?? '';
    _manufacturerController.text = widget.medicalData['fabricant'] ?? '';
    _priceController.text = widget.medicalData['prix']?.toString() ?? '';
    _quantityController.text = widget.medicalData['quantite']?.toString() ?? ''; // Initialize quantity field
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '💊 Modifier des Médicaments 💊',
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
              decoration: InputDecoration(labelText: 'Prix'),
            ),
            TextFormField(
              controller: _quantityController, // Use the new controller for quantity
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Quantité'),
            ),
            ElevatedButton(
              onPressed: () async {
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

                String jsonData = jsonEncode(medicationData);

                String medicationId = widget.medicalData['_id'];

                final response = await http.put(
                  Uri.parse('http://127.0.0.1:3000/api/update/$medicationId'),
                  headers: {"Content-Type": "application/json"},
                  body: jsonData,
                );

                if (response.statusCode == 200) {
                        ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Medication modified successfully'),
          backgroundColor: Colors.green,
        ),
      );
                  Navigator.pop(context, true); // Return true to indicate successful modification
                } else {
                  debugPrint('API Error: ${response.body}');
                }
              },
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 21, 228, 66),
              ),
              child: Text('Save Changes'),
            ),
          ],
        ),
      ),
    );
  }
}
