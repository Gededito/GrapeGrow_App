import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart' as geo;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:grapegrow_apps/core/constants/colors.dart';
import 'package:grapegrow_apps/data/models/maps/map_model.dart';
import 'package:grapegrow_apps/presentation/sebaran_hama/bloc/add_map_hama/add_map_hama_bloc.dart';
import 'package:location/location.dart';

class AddMapHama extends StatefulWidget {
  final double lat;
  final double lon;

  const AddMapHama({
    super.key,
    required this.lat,
    required this.lon,
  });

  @override
  State<AddMapHama> createState() => _AddMapHamaState();
}

class _AddMapHamaState extends State<AddMapHama> {
  final TextEditingController _addressController = TextEditingController();
  late GoogleMapController _mapController;
  final Set<Marker> _markers = {};

  void _createInitialMarker() {
    final marker = Marker(
      markerId: const MarkerId("position"),
      position: LatLng(widget.lat, widget.lon),
    );

    _markers.add(marker);
  }

  Future<void> _getPosition({
    required double lat,
    required double lon,
  }) async {
    _addressController.text = "Loading";

    final Location location = Location();
    late bool serviceEnabled;
    late PermissionStatus permissionGranted;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        _addressController.text = "Please enable location service";
        return;
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        _addressController.text = "Location permission needed";
        return;
      }
    }

    final info = await geo.placemarkFromCoordinates(
      lat,
      lon
    );

    if (info.isNotEmpty) {
      final place = info[0];
      _addressController.text =
        '${place.street}, ${place.subLocality}, ${place.locality},'
        '${place.postalCode}, ${place.country}';
    } else {
      _addressController.text = "Location not found";
    }

    if (mounted) {
      context.read<AddMapHamaBloc>().add(
        AddMapHamaEvent.setValue(data: MapModel(
          address: _addressController.text,
          latLng: LatLng(lat, lon)
        ))
      );
    }
  }

  void mapController(GoogleMapController value) {
    _mapController = value;
  }

  void setNewMarker({required double lat, required double lon}) async {
    _markers.clear();

    final marker = Marker(
      markerId: const MarkerId("position"),
      position: LatLng(lat, lon)
    );

    _markers.add(marker);

    _mapController.animateCamera(
      CameraUpdate.newLatLngZoom(LatLng(lat, lon), 15),
    );

    await _getPosition(lat: lat, lon: lon);
    setState(() {});
  }

  @override
  void initState() {
    _createInitialMarker();
    _getPosition(lat: widget.lat, lon: widget.lon);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _addressController.dispose();
    _mapController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Stack(
            children: [
              GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: LatLng(widget.lat, widget.lon),
                  zoom: 15,
                ),
                markers: _markers,
                onMapCreated: (controller) {
                  mapController(controller);
                },
                onTap: (LatLng latLng) {
                  setNewMarker(
                    lat: latLng.latitude,
                    lon: latLng.longitude,
                  );
                },
                onLongPress: (LatLng latLng) {
                  setNewMarker(
                    lat: latLng.latitude,
                    lon: latLng.longitude,
                  );
                },
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  height: 90,
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: TextField(
                    controller: _addressController,
                    enabled: false,
                    maxLines: 2,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}