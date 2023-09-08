import 'package:flutter/material.dart';
import 'package:flutter_app/Pharmacien/screens/home/update_medication.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(MaterialApp(home: ListMedicalPage()));
}

class ListMedicalPage extends StatefulWidget {
  const ListMedicalPage({Key? key}) : super(key: key);

  @override
  State<ListMedicalPage> createState() => _ListMedicalPageState();
}

class _ListMedicalPageState extends State<ListMedicalPage> {
  List<dynamic> medicalList = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final response = await http.get(Uri.parse('http://127.0.0.1:3000/api/find'));
    if (response.statusCode == 200) {
      setState(() {
        medicalList = json.decode(response.body);
      });
    } else {
      print('API Error: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '💊 List des Médicaments 💊',
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
      body: ListView.builder(
        itemCount: medicalList.length,
        itemBuilder: (BuildContext context, int index) {
          final medicalData = medicalList[index];
          return Card(
            elevation: 2,
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DataTable(
                    columns: [
                      DataColumn(
                        label: Text(
                          'Name',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Price',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Dosage',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Fabricant',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      DataColumn( // New DataColumn for Quantity
                        label: Text(
                          'Quantité',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                    rows: [
                      DataRow(cells: [
                        DataCell(Text(medicalData['name'] ?? 'No Name')),
                        DataCell(Text('${medicalData['prix'] ?? 'N/A'}')),
                        DataCell(Text(medicalData['dosage'] ?? 'No Dosage')),
                        DataCell(Text(medicalData['fabricant'] ?? 'No Fabricant')),
                        DataCell(Text('${medicalData['quantite'] ?? 'N/A'}')), // Include quantity cell
                      ]),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        onPressed: () async {
                          var isModified = await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  ModifyMedicalPage(medicalData: medicalData),
                            ),
                          );

                          if (isModified == true) {
                            fetchData(); // Refresh the list if modification was successful
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.orange,
                        ),
                        child: Text('Modify'),
                      ),
                      SizedBox(width: 10), // Add spacing between buttons
                      ElevatedButton(
                        onPressed: () async {
                          bool confirm = await showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('Delete Medication'),
                                content: Text(
                                  'Are you sure you want to delete this medication?'),
                                actions: [
                                  TextButton(
                                    onPressed: () => Navigator.of(context).pop(false),
                                    child: Text('Cancel'),
                                  ),
                                  TextButton(
                                    onPressed: () => Navigator.of(context).pop(true),
                                    child: Text('Delete'),
                                  ),
                                ],
                              );
                            },
                          );

                          if (confirm == true) {
                            // Perform delete action
                            String medicationId = medicalData['_id'];

                            final deleteResponse = await http.delete(
                              Uri.parse('http://127.0.0.1:3000/api/delete/$medicationId'),
                            );

                            if (deleteResponse.statusCode == 200) {
                              // Delete successful, refresh the list
                              fetchData();
                            } else {
                              print('Delete Error: ${deleteResponse.statusCode}');
                            }
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.red,
                        ),
                        child: Text('Delete'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}