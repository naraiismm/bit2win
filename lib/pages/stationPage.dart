import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:async';
import 'dart:typed_data';

class StationsPage extends StatefulWidget {
  @override
  _StationsPageState createState() => _StationsPageState();
}

class _StationsPageState extends State<StationsPage> {
  late GoogleMapController _mapController;
  Position? _currentPosition;
  BitmapDescriptor? _stationIcon;
  BitmapDescriptor? _userIcon;
  final TextEditingController _searchController = TextEditingController();
  List<String> _filteredLocations = [];
  bool _showDropdown = false;

  final CameraPosition _bakuLocation = const CameraPosition(
    target: LatLng(40.4093, 49.8671),
    zoom: 12,
  );

  final Map<String, LatLng> _stationLocations = {
    "Nerimanov Metro": LatLng(40.3975, 49.8671),
    "Icherisheher Metro": LatLng(40.3667, 49.8353),
    "Masazir": LatLng(40.5022, 49.7608),
    "Hovsan": LatLng(40.3347, 50.0477),
    "Qaracuxur": LatLng(40.4121, 49.9837),
    "Neftchilar": LatLng(40.3995, 49.9740),
    "Koroglu Metro": LatLng(40.4164, 49.9186),
    "Yeni Gunashli": LatLng(40.3719, 49.8944),
    "Ehmedli": LatLng(40.3975, 49.9553),
    "Xirdalan": LatLng(40.4586, 49.7558),
    "28 May": LatLng(40.3745, 49.8535),
    "Ganjlik": LatLng(40.3825, 49.8453),
    "Sahil": LatLng(40.3710, 49.8510),
    "Nizami": LatLng(40.3747, 49.8538),
    "Nesimi": LatLng(40.3723, 49.8420),
    "Sabayil": LatLng(40.3665, 49.8297),
    "Avtovagzal": LatLng(40.4126, 49.8499),
    "Derneuul": LatLng(40.3748, 49.8501),
    "Azadliq": LatLng(40.4155, 49.8390),
    "Xalqlar": LatLng(40.3844, 49.8912),
    "Keshla": LatLng(40.3901, 49.9312),
    "Hezi Aslanov": LatLng(40.3695, 49.9586),
    "Mardakan": LatLng(40.4900, 50.1467),
    "Surakhani": LatLng(40.4267, 50.0056),
    "Yeni Surakhani": LatLng(40.4284, 50.0091),
    "Turkan": LatLng(40.3586, 50.2633),
    "Lokbatan": LatLng(40.3189, 49.7417),
    "Dilara Aliyeva St": LatLng(40.3729, 49.8496),
    "Seferoglu St": LatLng(40.3942, 49.8343),
    "Murtuza Muxtarov St": LatLng(40.3726, 49.8392),
    "Mehdi Huseyn St": LatLng(40.3687, 49.8273),
    "Lev Tolstoy St": LatLng(40.3725, 49.8452),
    "Fuzuli St": LatLng(40.3761, 49.8420),
    "Mirzagha Aliyev Rd": LatLng(40.3755, 49.8298),
    "Rustamov St": LatLng(40.3790, 49.8443),
    "Nariman Narimanov Ave": LatLng(40.3874, 49.8489),
    "Bunyad Sardarov": LatLng(40.3721, 49.8295),
    "Suleyman Taghi Zadeh St": LatLng(40.3739, 49.8321),
    "Hasan Seyidbeyli St": LatLng(40.3781, 49.8359),
    "Ayna Sultanova": LatLng(40.4022, 49.8675),
    "Qurban Khalilov": LatLng(40.3753, 49.8332),
  };

  @override
  void initState() {
    super.initState();
    _setCustomMarkers();
    _getCurrentLocation();
    _filteredLocations = _stationLocations.keys.toList();
  }

  void _setCustomMarkers() async {
    _stationIcon = await BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRose);
    final ByteData data = await rootBundle.load('assets/images/profile_marker.png');
    final Uint8List bytes = data.buffer.asUint8List();
    _userIcon = BitmapDescriptor.fromBytes(bytes);
    setState(() {});
  }

  Future<void> _getCurrentLocation() async {
    Position position = await Geolocator.getCurrentPosition();
    setState(() {
      _currentPosition = position;
    });

    _mapController.animateCamera(
      CameraUpdate.newLatLng(LatLng(position.latitude, position.longitude)),
    );
  }

  void _filterLocations(String query) {
    setState(() {
      _filteredLocations = _stationLocations.keys
          .where((name) => name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  void _moveToLocation(String location) {
    LatLng? target = _stationLocations[location];
    if (target != null) {
      _mapController.animateCamera(CameraUpdate.newLatLng(target));
    }
    setState(() {
      _searchController.text = location;
      _showDropdown = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: _bakuLocation,
            markers: {
              if (_currentPosition != null)
                Marker(
                  markerId: MarkerId('userLocation'),
                  position: LatLng(_currentPosition!.latitude, _currentPosition!.longitude),
                  icon: _userIcon ?? BitmapDescriptor.defaultMarker,
                  infoWindow: InfoWindow(title: "You"),
                ),
              ..._stationLocations.entries.map(
                (entry) => Marker(
                  markerId: MarkerId(entry.key),
                  position: entry.value,
                  icon: _stationIcon ?? BitmapDescriptor.defaultMarker,
                ),
              ),
            },
            onMapCreated: (controller) {
              _mapController = controller;
            },
            myLocationEnabled: true,
            myLocationButtonEnabled: true,
          ),

          // Search Bar with Dropdown
          Positioned(
            top: 40,
            left: 20,
            right: 20,
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 10)],
                  ),
                  child: TextField(
                    controller: _searchController,
                    onTap: () => setState(() => _showDropdown = true),
                    onChanged: _filterLocations,
                    decoration: InputDecoration(
                      hintText: "Search for a station...",
                      prefixIcon: Icon(Icons.search, color: Colors.grey),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
                    ),
                  ),
                ),
                if (_showDropdown)
                  Container(
                    color: Colors.white,
                    child: Column(
                      children: _filteredLocations
                          .map((location) => ListTile(
                                title: Text(location),
                                onTap: () => _moveToLocation(location),
                              ))
                          .toList(),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
