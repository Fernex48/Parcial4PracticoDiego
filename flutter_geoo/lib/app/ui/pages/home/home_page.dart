// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _initialCameraPosition =
      const CameraPosition(target: LatLng(13.854797, -89.453690), zoom: 15);

  final preset = [
    {"id": "ciudad_arce", "lat": 13.854797, "lng": -89.453690},
    {"id": "salvador_del_mundo", "lat": 13.702236, "lng": -89.223395},
    {"id": "soyapango", "lat": 13.716382, "lng": -89.139535},
    {"id": "san_jacinto", "lat": 13.685898, "lng": -89.188600}
  ];

  String _selectedOffice = '';

  Iterable<Marker> _buildMarkers() {
    return preset.map((office) {
      return Marker(
          markerId: MarkerId(office['id'].toString()),
          position: LatLng(double.parse(office['lat'].toString()),
              double.parse(office['lng'].toString())),
          icon: office['id'] == _selectedOffice
              ? BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue)
              : BitmapDescriptor.defaultMarker,
          consumeTapEvents: true,
          onTap: () {
            setState(() {
              _selectedOffice = office['id'].toString();
            });
          });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: GoogleMap(
        initialCameraPosition: _initialCameraPosition,
        markers: _buildMarkers().toSet(),
      ),
      /*Column(
        children: [
          SizedBox(
            width: 200,
            height: 200,
            child: GoogleMap(
              initialCameraPosition: _initialCameraPosition,
              myLocationButtonEnabled: false,
            ),
          )
        ],
      ),*/
    );
  }
}
