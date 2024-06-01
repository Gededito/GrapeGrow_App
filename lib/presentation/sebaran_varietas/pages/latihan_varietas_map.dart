// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:grapegrow_apps/core/constants/colors.dart';

class LatihanVarietasMap extends StatefulWidget {
  const LatihanVarietasMap({super.key});

  @override
  State<LatihanVarietasMap> createState() => _LatihanVarietasMapState();
}

class _LatihanVarietasMapState extends State<LatihanVarietasMap> {
  final String fontPoppins = 'FontPoppins';

  // Latihan Menampilkan Peta Dengan Google Maps
  final dicodingOffice = const LatLng(-6.8957473, 107.6337669);

  /*
      Layaknya widget pada umumnya, Google Map mempunyai sebuah controller
        yang berfungsi untuk menyimpan state atau mengontrol layanan widget
  */
  late GoogleMapController mapController;

  final Set<Marker> markers = {};

  final tourismPlaces = const [
    LatLng(-6.8168954, 107.6151046),
    LatLng(-6.8331128, 107.6048483),
    LatLng(-6.8668408, 107.608081),
    LatLng(-6.9218518, 107.6025294),
    LatLng(-6.780725, 107.637409),
  ];

  // Fungsi untuk menambahkan marker
  void addManyMarker() {
    for (var tourismPlace in tourismPlaces) {
      markers.add(
        Marker(
          markerId: MarkerId("Tourism $tourismPlace"),
          position: tourismPlace,
          onTap: () {
            mapController.animateCamera(
              CameraUpdate.newLatLngZoom(tourismPlace, 18)
            );
          }
        ),
      );
    }
  }

  /*
      Fungsi untuk mendeteksi lokasi yang paling jauh. Untuk mengetahui lokasi
        mana yang ada di bagian atas dan bawah. Gunakan LatLngBounds untuk
        mengetahui lokasi di kanan-atas (northeast) dan kiri-bawah (southwest)
  */
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
      southwest: LatLng(x0!, y0!)
    );
  }

  @override 
  void initState() {
    super.initState();

    final marker = Marker(
      markerId: const MarkerId("dicoding"),
      position: dicodingOffice,
      onTap: () {
        mapController.animateCamera(
          CameraUpdate.newLatLngZoom(dicodingOffice, 18),
        );
      }
    );
    markers.add(marker);

    addManyMarker();
  }

  // Variabel untuk menampung tipe data
  MapType selectedMapType = MapType.normal;

  // Fungsi untuk mengatur style menggunakan file JSON
  Future<void> setMapStyle() async {
    String value = await DefaultAssetBundle.of(context).loadString('assets/maps/map_style.json');
    await mapController.setMapStyle(value);
  }

  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Map Sebaran Varietas",
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
          color: AppColors.white,
        ),
      ),
      body: Center(
        child: Stack(
          children: [
            GoogleMap(
              markers: markers,
              initialCameraPosition: CameraPosition(
                zoom: 18,
                target: dicodingOffice
              ),
              onMapCreated: (controller) async {
                setState(() {
                  mapController = controller;
                });

                final bound = boundsFromLatLngList([dicodingOffice, ...tourismPlaces]);
                mapController.animateCamera(
                  CameraUpdate.newLatLngBounds(bound, 50)
                );

                await setMapStyle();
              },

              myLocationButtonEnabled: false,
              zoomControlsEnabled: false,
              mapToolbarEnabled: false,
              mapType: selectedMapType,
            ),
            Positioned(
              bottom: 16,
              right: 16,
              child: Column(
                children: [
                  FloatingActionButton.small(
                    heroTag: "zoom-in",
                    onPressed: () {
                      mapController.animateCamera(
                        CameraUpdate.zoomIn(),
                      );
                    },
                    child: const Icon(Icons.add),
                  ),
                  FloatingActionButton.small(
                    heroTag: "zoom-out",
                    onPressed: () {
                      mapController.animateCamera(
                        CameraUpdate.zoomOut(),
                      );
                    },
                    child: const Icon(Icons.remove),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 16,
              right: 16,
              child: FloatingActionButton.small(
                onPressed: null,
                child: PopupMenuButton<MapType>(
                  onSelected: (MapType item) {
                    setState(() {
                      selectedMapType = item;
                    });
                  },
                  offset: const Offset(0, 54),
                  icon: const Icon(Icons.layers_outlined),
                  itemBuilder: (BuildContext context) => <PopupMenuEntry<MapType>>[
                    const PopupMenuItem<MapType>(
                      value: MapType.normal,
                      child: Text('Normal'),
                    ),
                    const PopupMenuItem<MapType>(
                      value: MapType.satellite,
                      child: Text('Satellite'),
                    ),
                    const PopupMenuItem<MapType>(
                      value: MapType.hybrid,
                      child: Text('Hybrid'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: AppColors.white,
        child: const Icon(
          Icons.add,
          size: 30,
          color: AppColors.primary,
        ),
      ),
    );
  }
}