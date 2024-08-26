import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:smart_car/config/const.dart';

class NavigationMapScreen extends StatefulWidget {
  @override
  _NavigationMapScreenState createState() => _NavigationMapScreenState();
}

class _NavigationMapScreenState extends State<NavigationMapScreen> {
  GoogleMapController? _controller;
  LatLng _currentLocation = LatLng(49.1703, -123.1368); // Richmond, BC (default location)
  final Set<Marker> _markers = {};
  bool _isMapCreated = false;
  Timer? _timer;
  int _routeIndex = 0;
  List<LatLng> _routeCoordinates = [];
  BitmapDescriptor? _carIcon;

  @override
  void initState() {
    super.initState();
    _setCustomMarker();
    _getCurrentLocation();
    _setupRoute();
    _startSimulation();
  }

  Future<void> _setCustomMarker() async {
    _carIcon = await BitmapDescriptor.fromAssetImage(
      ImageConfiguration(devicePixelRatio: 2.5, size: Size(80, 50)), 
      FilePath.cartop,
    );
  }

  Future<void> _getCurrentLocation() async {
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    setState(() {
      _currentLocation = LatLng(position.latitude, position.longitude);
      if (_isMapCreated) {
        _controller?.animateCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(target: _currentLocation, zoom: 15),
          ),
        );
        _applyMapStyle();
      }
    });
  }

  void _setupRoute() {
    // Define a route in Richmond, BC
    _routeCoordinates = [
      LatLng(49.1703, -123.1368),
      LatLng(49.1715, -123.1380),
      LatLng(49.1730, -123.1392),
      LatLng(49.1745, -123.1405),
      LatLng(49.1760, -123.1420), 
    ];
  }

  void _startSimulation() {
    _timer = Timer.periodic(Duration(seconds: 2), (timer) {
      if (_routeIndex < _routeCoordinates.length) {
        _moveMarker(_routeCoordinates[_routeIndex]);
        _routeIndex++;
      } else {
        _timer?.cancel(); // Stop the simulation when the route is completed
      }
    });
  }

  void _moveMarker(LatLng position) {
    setState(() {
      _markers.clear();
      _markers.add(
        Marker(
          markerId: MarkerId('movingCar'),
          position: position,
          icon: _carIcon ?? BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
        ),
      );
      _controller?.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(target: position, zoom: 15, tilt: 0), // The car will always be centered
        ),
      );
    });
  }

  void _applyMapStyle() {
    if (_controller != null) {
      _controller!.setMapStyle(_darkMapStyle);
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            onMapCreated: (GoogleMapController controller) {
              _controller = controller;
              _isMapCreated = true;
              _applyMapStyle();
              _controller?.animateCamera(
                CameraUpdate.newCameraPosition(
                  CameraPosition(target: _currentLocation, zoom: 15),
                ),
              );
            },
            initialCameraPosition: CameraPosition(
              target: _currentLocation,
              zoom: 15,
            ),
            markers: _markers,
            myLocationEnabled: true,
            myLocationButtonEnabled: false,
            onCameraIdle: () {
              // Re-center the car marker if needed
              setState(() {
                _moveMarker(_routeCoordinates[_routeIndex]);
              });
            },
          ),
        
          Positioned(
            top: 40,
            left: 20,
            right: 20,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.8),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "400m",
                    style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "In 400m take turning right",
                    style: TextStyle(color: Colors.white70, fontSize: 16),
                  ),
                ],
              ),
            ),
          ),
          // User location and navigation pointer
          Positioned(
            bottom: 40,
            left: 20,
            right: 20,
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.8),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.navigation, color: Colors.white, size: 30),
                  SizedBox(width: 15),
                  Text(
                    "Proceed on Thornridge Cir.",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Dark Map Style 
  String get _darkMapStyle => '''[
    {
      "elementType": "geometry",
      "stylers": [
        {
          "color": "#212121"
        }
      ]
    },
    {
      "elementType": "labels.icon",
      "stylers": [
        {
          "visibility": "on"
        }
      ]
    },
    {
      "elementType": "labels.text.fill",
      "stylers": [
        {
          "color": "#757575"
        }
      ]
    },
    {
      "elementType": "labels.text.stroke",
      "stylers": [
        {
          "color": "#212121"
        }
      ]
    },
    {
      "featureType": "road",
      "elementType": "geometry.fill",
      "stylers": [
        {
          "color": "#2c2c2c"
        }
      ]
    },
    {
      "featureType": "road",
      "elementType": "labels.text.fill",
      "stylers": [
        {
          "color": "#8a8a8a"
        }
      ]
    },
    {
      "featureType": "water",
      "elementType": "geometry",
      "stylers": [
        {
          "color": "#000000"
        }
      ]
    }
  ]''';
}
