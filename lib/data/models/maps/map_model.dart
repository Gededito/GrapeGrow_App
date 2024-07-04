import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapModel {
  LatLng latLng;
  String address;

  MapModel({
    required this.latLng,
    required this.address,
  });
}