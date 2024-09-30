import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart' as geo;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:grapegrow_apps/core/constants/colors.dart';
import 'package:grapegrow_apps/data/models/responses/sebaran/add_sebaran_varietas_response.dart';
import 'package:grapegrow_apps/presentation/sebaran_varietas/bloc/all_sebaran_varietas/all_sebaran_varietas_bloc.dart';
import 'package:grapegrow_apps/presentation/sebaran_varietas/pages/add_varietas_sebaran.dart';
import 'package:location/location.dart';

class MapSebaranVarietas extends StatefulWidget {
  final double lat;
  final double lon;

  const MapSebaranVarietas({
    super.key,
    required this.lat,
    required this.lon,
  });

  @override
  State<MapSebaranVarietas> createState() => _MapSebaranVarietasState();
}

class _MapSebaranVarietasState extends State<MapSebaranVarietas> {
  final String fontPoppins = 'FontPoppins';
  late GoogleMapController mapController;
  MapType selectedMapType = MapType.satellite;
  final Set<Marker> markers = {};
  geo.Placemark? placemark;
  LatLng? myLocation;

  LatLngBounds boundsFromLatLngList(List<LatLng> list) {
    double? x0, x1, y0, y1;
    for (LatLng latLng in list) {
      if (x0 == null) {
        x0 = x1 = latLng.latitude;
        y0 = y1 = latLng.longitude;
      } else {
        if (latLng.latitude > x1!) x1 = latLng.latitude;
        if (latLng.latitude < x0) x0 = latLng.latitude;
        if (latLng.longitude > y1!) y1 = latLng.longitude;
        if (latLng.longitude < y0!) y0 = latLng.longitude;
      }
    }
    return LatLngBounds(
      northeast: LatLng(x1!, y1!),
      southwest: LatLng(x0!, y0!),
    );
  }

  Future<void> _getUserLocation({
    required double lat,
    required double lon,
  }) async {
    final Location location = Location();
    late bool serviceEnabled;
    late PermissionStatus permissionGranted;
    late LocationData locationData;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Please enable location service")),
        );
        return;
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Location permission needed")),
        );
        return;
      }
    }

    locationData = await location.getLocation();
    setState(() {
      myLocation = LatLng(locationData.latitude!, locationData.longitude!);
    });
  }

  @override
  void initState() {
    super.initState();
    
    context.read<AllSebaranVarietasBloc>().add(const AllSebaranVarietasEvent.getAllSebaran());

    _getUserLocation(
      lat: widget.lat,
      lon: widget.lon,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Map Sebaran Varietas',
          style: TextStyle(
            fontSize: 16,
            fontFamily: fontPoppins,
            fontWeight: FontWeight.w500,
            color: AppColors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: AppColors.primary,
        iconTheme: const IconThemeData(
          color: AppColors.white
        ),
      ),
      body: Center(
        child: Stack(
          children: [
            BlocBuilder<AllSebaranVarietasBloc, AllSebaranVarietasState>(
              builder: (context, state) {
                return state.maybeWhen(
                  orElse: () => const Center(child: Text("Lokasi Tidak Muncul")),
                  loading: () => const Center(child: CircularProgressIndicator()),
                  success: (datas) {
                    addManyMarker(datas.sebaranVarietas);

                    if (myLocation != null) {
                      final allLocations = [myLocation!, ...datas.sebaranVarietas.map((sebaran) => LatLng(sebaran.lat, sebaran.lon))];
                      final bounds = boundsFromLatLngList(allLocations);

                      return GoogleMap(
                        initialCameraPosition: CameraPosition(
                          target: LatLng(widget.lat, widget.lon),
                          zoom: 20,
                        ),
                        markers: markers,
                        mapType: selectedMapType,
                        myLocationEnabled: true,
                        myLocationButtonEnabled: false,
                        mapToolbarEnabled: false,
                        zoomControlsEnabled: false,
                        onMapCreated: (controller) async {
                          setState(() {
                            mapController = controller;
                          });

                          if (myLocation != null) {
                            mapController.animateCamera(
                              CameraUpdate.newLatLngBounds(bounds, 50),
                            );
                          }
                        },
                      );
                    } else {
                      return const Center(child: Text("Menunggu lokasi...."));
                    }
                  }
                );
              }
            ),
            Positioned(
              top: 16,
              left: 16,
              child: FloatingActionButton.small(
                heroTag: "myLocation",
                onPressed: () => onMyLocationButtonPress(),
                child: const Icon(Icons.my_location),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddVarietasSebaran()
            )
          );
        },
        backgroundColor: AppColors.white,
        icon: const Icon(
          Icons.add,
          size: 30,
          color: AppColors.primary,
        ),
        label: Text(
          "Tambah Sebaran",
          style: TextStyle(
            fontFamily: fontPoppins,
            color: AppColors.primary
          ),
        ),
      ),
    );
  }

  void onLongPressGoogleMap(LatLng latLng) async {
    final info = await geo.placemarkFromCoordinates(latLng.latitude, latLng.longitude);

    final place = info[0];
    final street = place.street!;
    final address = '${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';

    setState(() {
      placemark = place;
      markers.clear();
    });

    _addMarker (latLng, street, address, "myLocation");

    mapController.animateCamera(
      CameraUpdate.newLatLng(latLng),
    );
  }

  void _addMarker (LatLng latLng, String street, String address, String markerId) {
    final marker = Marker(
      markerId: MarkerId(markerId),
      position: latLng,
      infoWindow: InfoWindow(
        title: street,
        snippet: address,
      ),
    );

    setState(() {
      markers.clear();
      markers.add(marker);
    });
  }

  void onMyLocationButtonPress() async {
    await _getUserLocation(
      lat: widget.lat,
      lon: widget.lon
    );

    mapController.animateCamera(
        CameraUpdate.newLatLng(myLocation!)
    );
  }

  void addManyMarker(List<SebaranVarietas> sebaranList) async {
    for (var sebaran in sebaranList) {
      final lokasiSebaran = LatLng(sebaran.lat, sebaran.lon);

      final info = await geo.placemarkFromCoordinates(lokasiSebaran.latitude, lokasiSebaran.longitude);
      final place = info[0];
      final street = place.street ?? "";
      final address = '${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';

      markers.add(
        Marker(
          markerId: MarkerId("Sebaran $lokasiSebaran"),
          position: lokasiSebaran,
          infoWindow: InfoWindow(
            title: street,
            snippet: address,
          ),
          onTap: () {
            mapController.animateCamera(
              CameraUpdate.newLatLngZoom(lokasiSebaran, 20)
            );
          }
        ),
      );
    }
  }
}