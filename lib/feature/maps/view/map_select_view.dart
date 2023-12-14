import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapSelectView extends StatefulWidget {
  const MapSelectView({super.key});

  @override
  State<MapSelectView> createState() => _MapSelectViewState();
}

class _MapSelectViewState extends State<MapSelectView> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: GoogleMap(initialCameraPosition: CameraPosition(target: LatLng(37.4223, -122.0848), zoom: 13)),
    );
  }
}
