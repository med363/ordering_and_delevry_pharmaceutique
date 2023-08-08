import 'package:flutter/material.dart';

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

  @override
  void dispose() {
    // Clean up the controllers when the page is disposed
    _nameController.dispose();
    _dosageController.dispose();
    _descriptionController.dispose();
    _manufacturerController.dispose();
    _priceController.dispose();
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
                  255, 21, 228, 66), // Green color like pharmacy logo
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
              keyboardType: TextInputType.number, // Allow only numeric input
              decoration: InputDecoration(labelText: 'Prix'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Handle form submission and add the medication
                String medicationName = _nameController.text;
                String medicationDosage = _dosageController.text;
                String medicationDescription = _descriptionController.text;
                String medicationManufacturer = _manufacturerController.text;
                double medicationPrice = double.tryParse(_priceController.text) ?? 0.0;

                // Perform the logic to save the medication details here
                // For now, we'll just log the data.
                debugPrint('Medication Name: $medicationName');
                debugPrint('Medication Dosage: $medicationDosage');
                debugPrint('Medication Description: $medicationDescription');
                debugPrint('Medication Manufacturer: $medicationManufacturer');
                debugPrint('Medication Price: $medicationPrice');

                // Close the AddMedicationPage and return to the previous page
                Navigator.pop(context);
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
