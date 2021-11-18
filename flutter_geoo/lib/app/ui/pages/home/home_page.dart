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
      const CameraPosition(target: LatLng(13.831604, -89.270310), zoom: 10.5);

  final preset = [
    {
      "id": "ciudad_arce",
      "lat": 13.854797,
      "lng": -89.453690,
      "titulo": "Ciudad Arce Centro",
      "desc": "Ciudad Arce"
    },
    {
      "id": "salvador_del_mundo",
      "lat": 13.702236,
      "lng": -89.223395,
      "titulo": "Salvador del Mundo",
      "desc": "65 Ave Norte, San Salvador"
    },
    {
      "id": "soyapango",
      "lat": 13.716382,
      "lng": -89.139535,
      "titulo": "Soyapango Centro",
      "desc": "SAL 03E"
    },
    {
      "id": "san_jacinto",
      "lat": 13.685898,
      "lng": -89.188600,
      "titulo": "San Jacinto Centro",
      "desc": "Ave Barbarena, San Salvador"
    },
    {
      "id": "centro_san_salvador",
      "lat": 13.699654,
      "lng": -89.105523,
      "titulo": "Centro de San Salvador",
      "desc": "Blvr Hugo Chávez, San Salvador"
    }
  ];

  String _selectedOffice = '';

  Iterable<Marker> _buildMarkers() {
    return preset.map((office) {
      return Marker(
          markerId: MarkerId(office['id'].toString()),
          position: LatLng(double.parse(office['lat'].toString()),
              double.parse(office['lng'].toString())),
          infoWindow: InfoWindow(
            title: office['titulo'].toString(),
            snippet: office['desc'].toString(),
          ),
          icon: office['id'] == _selectedOffice
              ? BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue)
              : BitmapDescriptor.defaultMarker,
          consumeTapEvents: false,
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
      appBar: AppBar(
        title: const Text("Sucursales Movil SV"),
      ),
      body: GoogleMap(
        initialCameraPosition: _initialCameraPosition,
        markers: _buildMarkers().toSet(),
        //mapType: MapType.hybrid,
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
