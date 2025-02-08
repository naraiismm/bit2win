import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class StationsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      initialCameraPosition: const CameraPosition(
        target: LatLng(40.4093, 49.8671), // Example location (Baku, Azerbaijan)
        zoom: 12,
      ),
      markers: {
        const Marker(
          markerId: MarkerId('station1'),
          position: LatLng(40.4093, 49.8671),
          infoWindow: InfoWindow(title: 'Recycling Station 1'),
        ),
      },
    );
  }
}

