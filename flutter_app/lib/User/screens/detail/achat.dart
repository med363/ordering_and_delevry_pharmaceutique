import 'dart:io';
import 'package:http_parser/http_parser.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:image_picker/image_picker.dart';
import '../../../config.dart';

class CartFormScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Online Payment')),
      backgroundColor: Colors.blueGrey[50],
      body: Center(
        child: Card(
          color: Color.fromARGB(255, 197, 255, 242),
          elevation: 4,
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          // Ajustez les marges verticales
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              // Utilisez un SingleChildScrollView pour faire défiler le contenu si nécessaire
              child: CartForm(),
            ),
          ),
        ),
      ),
    );
  }
}

class CartForm extends StatefulWidget {
  @override
  _CartFormState createState() => _CartFormState();
}

class _CartFormState extends State<CartForm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _priceController = TextEditingController();
  TextEditingController _quantityController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _typeController = TextEditingController();
  TextEditingController _codeInternetController = TextEditingController();
  String _selectedType = ''; // Variable pour stocker le type sélectionné
  bool _showImageField = false;

  XFile? _selectedImage; // Declare the _selectedImage variable

  var _imageName;

  Future<void> _pickImage() async {
    XFile? imageFile =
        await ImagePicker().pickImage(source: ImageSource.camera);

    if (imageFile != null) {
      setState(() {
        _selectedImage = imageFile;
      });
    }
  }

  Future<void> registerpaiement() async {
    try {
      if (_selectedImage == null) {
        print("Image is not selected");
        return;
      }

      if (_nameController.text.isEmpty ||
          _priceController.text.isEmpty ||
          _quantityController.text.isEmpty ||
          _emailController.text.isEmpty ||
          _codeInternetController.text.isEmpty) {
        print("All fields are required");
        return;
      }

      // Other validation checks

      var request = http.MultipartRequest(
        "POST",
        Uri.parse(achat_cbn),
      );

      // Construct the image file part
      var imageBytes = await _selectedImage!.readAsBytes();
      var imageFile = http.MultipartFile.fromBytes(
        "ordonnance",
        imageBytes,
        filename: "image.jpg", // Provide a filename here
        contentType: MediaType('image', 'jpeg'), // Use 'jpeg' instead of 'jpg'
      );

      // Add the image file part to the request's files
      request.files.add(imageFile);

      // Add other fields to the request
      request.fields["noms"] = _nameController.text;
      request.fields["type"] = _selectedType;
      request.fields["Number"] = _quantityController.text;
      request.fields["prix"] = _priceController.text;
      request.fields["patient"] = _emailController.text;

      // Send the request
      var response = await request.send();

      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(await response.stream.bytesToString());
        print("Image Upload and Registration Successful");
        //print(jsonResponse['status']);
        Navigator.pop(context);
        print("bien enregistrer");
      } else {
        print("Image Upload Failed with Status Code: ${response.statusCode}");
      }
    } catch (error) {
      print("Error during registration: $error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Enter Payment Details',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20),
          TextFormField(
            controller: _nameController,
            decoration: InputDecoration(
              labelText: 'Product Name',
              prefixIcon: Icon(Icons.shopping_cart),
            ),
          ),
          SizedBox(height: 10),
          TextFormField(
            controller: _priceController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: 'Price (\$)',
              prefixIcon: Icon(Icons.attach_money),
            ),
          ),
          SizedBox(height: 10),
          TextFormField(
            controller: _quantityController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: 'Quantity',
              prefixIcon: Icon(Icons.format_list_numbered),
            ),
          ),
          SizedBox(height: 10),
          TextFormField(
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              labelText: 'Email',
              prefixIcon: Icon(Icons.email),
            ),
          ),
          SizedBox(height: 10),
          DropdownButtonFormField<String>(
            value: _selectedType.isEmpty ? null : _selectedType,
            decoration: InputDecoration(
              labelText: 'Type',
              prefixIcon: Icon(Icons.category),
            ),
            items: ['Médicament', 'Parapharmacie'].map((type) {
              return DropdownMenuItem<String>(
                value: type,
                child: Text(type),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                _selectedType = value!;
                _showImageField = value == 'Médicament';
              });
            },
          ),
          if (_showImageField)
            Column(
              children: [
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: _pickImage,
                  child: Text('Scanner Votre ordonnance'),
                ),
                if (_selectedImage != null)
                  SizedBox(
                    height: 200,
                    child: Image.network(
                        _selectedImage!.path), // Use Image.network for web
                  ),
              ],
            ),
          SizedBox(height: 10),
          TextFormField(
            controller: _codeInternetController,
            decoration: InputDecoration(
              labelText: 'Internet Code',
              prefixIcon: Icon(Icons.code),
            ),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  registerpaiement();
                },
                child: Text('Valider Achat'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                  textStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                  // Ajoutez d'autres propriétés de style ici
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Back'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.grey,
                  textStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                  // Ajoutez d'autres propriétés de style ici
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
