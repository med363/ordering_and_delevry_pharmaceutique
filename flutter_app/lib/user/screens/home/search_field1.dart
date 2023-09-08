import 'package:flutter/material.dart';
import '../../model/pharmacy.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class SearchField1 extends StatefulWidget {
  const SearchField1({Key? key}) : super(key: key);

  @override
  _SearchField1State createState() => _SearchField1State();
}

class _SearchField1State extends State<SearchField1> {
  List<Pharmacy> searchResults = [];

  void _searchMedication(String query) {
    setState(() {
      searchResults = pharmacies.where((pharmacy) {
        return pharmacy.medications.any(
            (medication) => medication.name.toLowerCase().contains(query.toLowerCase()));
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: 500), // Set an appropriate max height
      child: Column(
        children: [
          AppBar(
            backgroundColor: Color.fromARGB(255, 243, 243, 243),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            centerTitle: true,
            title: TextField(
              onChanged: _searchMedication,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                hintText: "Search medicament ",
                prefixIcon: Icon(Icons.search),
                hintStyle: TextStyle(
                  fontSize: 14,
                  color: Color(0xFFBDBDBD),
                ),
              ),
            ),
            actions: [
              IconButton(
                icon: Icon(Icons.camera_alt),
                onPressed: () {
                  // Action lors du clic sur l'icône de l'appareil photo/vidéo
                },
              ),
              IconButton(
                icon: Icon(Icons.qr_code_scanner_outlined),
                onPressed: () {
                  // Action lors du clic sur l'icône de l'appareil photo/vidéo
                },
              ),
              IconButton(
                icon: Icon(Icons.mic),
                onPressed: () {
                  // Action lors du clic sur l'icône de la voix
                },
              ),
            ],
          ),
          Expanded(
            child: SearchResultsWidget(searchResults: searchResults),
          ),
        ],
      ),
    );
  }
}
class SearchResultsWidget extends StatelessWidget {
  final List<Pharmacy> searchResults;

  SearchResultsWidget({required this.searchResults});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: searchResults.length,
      separatorBuilder: (context, index) => Divider(),
      itemBuilder: (context, index) {
        Pharmacy pharmacy = searchResults[index];
        return Card(
          elevation: 2,
          margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          color: Colors.white, // Background color of the card
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: ListTile(
            title: Text(
              pharmacy.name,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.blue, // Text color
              ),
            ),
            subtitle: Text(pharmacy.address),
            leading: Icon(
              Icons.local_pharmacy,
              color: Colors.green, // Icon color
            ),
            trailing: Wrap(
              spacing: 8,
              children: pharmacy.medications
                  .map((medication) => Icon(
                        Icons.medical_services,
                        color: Colors.red, // Medication icon color
                      ))
                  .toList(),
            ),
            onTap: () {
              // Handle tap on the pharmacy item
            },
          ),
        );
      },
    );
  }
}
