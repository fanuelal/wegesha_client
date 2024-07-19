import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shimmer/shimmer.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:wegesha_client/screens/callScreen.dart';

import '../config/theme.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  static const double _initialCameraZoom = 16;
  LatLng _currentPosition = const LatLng(11.571728, 37.389113);
  LatLng _destination = const LatLng(11.571728, 37.389113);
  GoogleMapController? _mapController;
  List<LatLng> _polylineCoordinates = [];
  Set<Polyline> _polylines = {};
  final String _googleApiKey = 'AIzaSyCCT6MWoYFOymnKTRMBmkl6QIzRdWkEPKI';
  bool _isMapLoading = true;
  BitmapDescriptor? _currentMarkerIcon;
  BitmapDescriptor? _destinationMarkerIcon;

  @override
  void initState() {
    super.initState();
    _loadCustomMarkerIcons();
    _getCurrentLocation();
  }

  @override
  void dispose() {
    _mapController?.dispose();
    super.dispose();
  }

  Future<void> _loadCustomMarkerIcons() async {
    _currentMarkerIcon = await BitmapDescriptor.fromAssetImage(
      const ImageConfiguration(size: Size(48, 48)),
      'assets/client.png',
    );
    _destinationMarkerIcon = await BitmapDescriptor.fromAssetImage(
      const ImageConfiguration(size: Size(38, 38)),
      'assets/ambulance.png',
    );
    setState(() {});
  }

  void _getCurrentLocation() async {
    var status = await Permission.location.request();

    if (status.isGranted) {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);

      setState(() {
        _currentPosition = LatLng(position.latitude, position.longitude);
        _isMapLoading = false;
      });

      _getPolyline();
    } else if (status.isDenied || status.isPermanentlyDenied) {
      print("Location permission denied");
    }
  }

  void _getPolyline() async {
    PolylinePoints polylinePoints = PolylinePoints();
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      _googleApiKey,
      PointLatLng(_currentPosition.latitude, _currentPosition.longitude),
      PointLatLng(_destination.latitude, _destination.longitude),
    );

    if (result.points.isNotEmpty) {
      _polylineCoordinates.clear();
      result.points.forEach((PointLatLng point) {
        _polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });

      setState(() {
        _polylines.add(Polyline(
          polylineId: const PolylineId('polyline'),
          visible: true,
          points: _polylineCoordinates,
          width: 4,
          color: Colors.blue,
        ));
      });
    }
  }

  void _updateLocation() async {
    Geolocator.getPositionStream(
      locationSettings: const LocationSettings(
        accuracy: LocationAccuracy.high,
        distanceFilter: 10,
      ),
    ).listen((Position position) {
      setState(() {
        _currentPosition = LatLng(position.latitude, position.longitude);
      });
      _mapController?.animateCamera(CameraUpdate.newLatLng(_currentPosition));
      _getPolyline();
    });
  }

  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
    setState(() {
      _isMapLoading = false;
    });
    _updateLocation();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          title: const Text("HCP Location"),
          elevation: 0,
        ),
        body: Stack(
          children: [
            GoogleMap(
              initialCameraPosition: CameraPosition(
                target: _currentPosition,
                zoom: _initialCameraZoom,
              ),
              onMapCreated: _onMapCreated,
              polylines: _polylines,
              markers: {
                if (_currentMarkerIcon != null)
                  Marker(
                    markerId: const MarkerId('origin'),
                    position: _currentPosition,
                    icon: _currentMarkerIcon!,
                    infoWindow: const InfoWindow(title: 'Origin'),
                  ),
                if (_destinationMarkerIcon != null)
                  Marker(
                    markerId: const MarkerId('destination'),
                    position: _destination,
                    icon: _destinationMarkerIcon!,
                    infoWindow: const InfoWindow(title: 'Destination'),
                  ),
              },
            ),
            if (_isMapLoading)
              Positioned.fill(
                child: Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: Container(
                    color: Colors.white,
                  ),
                ),
              ),
            Align(
              alignment: AlignmentDirectional.bottomEnd,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 16.0, right: 16.0),
                child: FloatingActionButton(
                  backgroundColor: ColorTheme.primaryColor,
                  foregroundColor: ColorTheme.white,
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => PrebuiltCallPage(
                              callId: 'videoCall_00wegesha',
                            )));
                  },
                  child: const Icon(Icons.video_call),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
