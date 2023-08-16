import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PharmacyLocationMapScreen extends StatefulWidget {
  @override
  _PharmacyLocationMapScreenState createState() =>
      _PharmacyLocationMapScreenState();
}

class _PharmacyLocationMapScreenState
    extends State<PharmacyLocationMapScreen> {
  LatLng? selectedLocation;

  void onMapTap(LatLng latLng) {
    setState(() {
      selectedLocation = latLng;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Select Pharmacy Location')),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(0, 0),  // Initial map center
          zoom: 15.0,
        ),
        onTap: onMapTap,
        markers: selectedLocation != null
            ? {
                Marker(
                  markerId: MarkerId('selectedLocation'),
                  position: selectedLocation!,
                ),
              }
            : Set<Marker>(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Return the selected location to the previous screen
          Navigator.pop(context, selectedLocation);
        },
        child: Icon(Icons.check),
      ),
    );
  }
}
