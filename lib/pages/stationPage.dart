import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class StationsPage extends StatefulWidget {
  @override
  _StationsPageState createState() => _StationsPageState();
}

class _StationsPageState extends State<StationsPage> {
  late GoogleMapController _mapController;

  final CameraPosition _initialLocation = const CameraPosition(
    target: LatLng(40.4093, 49.8671), // Baku, Azerbaijan
    zoom: 12,
  );

  final Set<Marker> _markers = {
    const Marker(
      markerId: MarkerId('station1'),
      position: LatLng(40.4093, 49.8671),
      infoWindow: InfoWindow(title: 'Recycling Station 1'),
    ),
  };

  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Recycling Stations')),
      body: GoogleMap(
        initialCameraPosition: _initialLocation,
        markers: _markers,
        onMapCreated: _onMapCreated,
      ),
    );
  }
}