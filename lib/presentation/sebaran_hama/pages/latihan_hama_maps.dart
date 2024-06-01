import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart' as geo;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:grapegrow_apps/core/constants/colors.dart';
import 'package:location/location.dart';

class LatihanHamaMap extends StatefulWidget {
  const LatihanHamaMap({super.key});

  @override
  State<LatihanHamaMap> createState() => _LatihanHamaMapState();
}

class _LatihanHamaMapState extends State<LatihanHamaMap> {
  final String fontPoppins = 'FontPoppins';
  
  // Latihan Mendapatkan Lokasi Perangkat Pengguna

  final dicodingOffice = const LatLng(-6.8957473, 107.6337669);

  late GoogleMapController mapController;

  late final Set<Marker> markers = {};

  // Siapkan variabel placemark untuk menyimpan informasi lokasi dari titik koor
  geo.Placemark? placemark;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Map Sebaran Hama",
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
              initialCameraPosition: CameraPosition(
                zoom: 18,
                target: dicodingOffice,
              ),
              markers: markers,
              zoomControlsEnabled: false,
              mapToolbarEnabled: false,
              myLocationButtonEnabled: false,
              myLocationEnabled: true,

              /*
                  Definisikan mapController melalui callback onMapCreated
                    serta pasang marker untuk lokasi dicodingOffice
              */
              onMapCreated: (controller) async {

                // Lakukan reverse geocoding di dalam callback onMapCreated
                final info = await geo.placemarkFromCoordinates(
                  dicodingOffice.latitude,
                  dicodingOffice.longitude,
                );

                final place = info[0];
                final street = place.street!;
                final address = '${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';

                setState(() {
                  placemark = place;
                });

                defineMarker(dicodingOffice, street, address);

                setState(() {
                  mapController = controller;
                });

                // final marker = Marker(
                //   markerId: const MarkerId("source"),
                //   position: dicodingOffice,
                // );
                //
                // setState(() {
                //   mapController = controller;
                //   markers.add(marker);
                // });
              },

              // Menambahkan callback onLongPress
              onLongPress: (LatLng latLng) {
                onLongPressGoogleMap(latLng);
              }

            ),
            Positioned(
              top: 16,
              right: 16,
              child: FloatingActionButton(
                child: const Icon(Icons.my_location),
                onPressed: () {
                  onMyLocationButtonPress();
                },
              ),
            ),
            if (placemark == null)
              const SizedBox()
            else 
              Positioned(
                bottom: 16,
                right: 16,
                left: 16,
                child: PlacemarkWidget(placemark: placemark!),
              )
          ],
        ),
      ),
    );
  }

  // Membuat fungsi onLongPressGoogleMap
  /*
      Ketika pengguna menekan lokasi pada peta, callback akan mengembalikan
        titik koordinat dan menjalankan fungsi onLongPressGoogleMap
  */
  void onLongPressGoogleMap(LatLng latLng) async {

    // Menambahkan fungsi untuk reverse geocoding dan definisikan window marker
    final info = await geo.placemarkFromCoordinates(latLng.latitude, latLng.longitude);

    final place = info[0];
    final street = place.street!;
    final address = '${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';

    setState(() {
      placemark = place;
    });

    /*
        Pasang marker untuk mengetahui posisi koordinat yang ditekan oleh
          pengguna. Manfaatkan fungsi defineMarker untuk menampilkan marker
          yang sudah dideklarasikan sebelumnya
    */
    defineMarker(latLng, street, address);

    /*
        Arahkan view peta dengan menganimasikan camera view berdasarkan
          titik koordinat tersebut
    */
    mapController.animateCamera(
      CameraUpdate.newLatLng(latLng),
    );
  }

  // Definisikan marker untuk lokasi perangkat menggunakan Marker
  void defineMarker(LatLng latLng, String street, String address) {
    final marker = Marker(
      markerId: const MarkerId("source"),
      position: latLng,

      /*
          Untuk mendefinisikan window marker berdasarkan informasi alamat,
            Kita perlu menambahkan argumen baru di fungsi defineMarker.
            Dengan begitu, variabel street dan address dapat ditampilkan
            dalam window marker.
      */
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


  /*
      Fungsi bernama  onMyLocationButtonPress untuk menjalankan aksi tombol
        dan jalankan pada callback onPressed
  */
  void onMyLocationButtonPress() async {
    final Location location = Location();
    late bool serviceEnabled;
    late PermissionStatus permissionGranted;
    late LocationData locationData;

    // Periksa layanan dan permission lokasi perangkat
    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        print("Location services is not available");
        return;
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        print("Location permission is denied");
        return;
      }
    }

    // Setelah itu, dapatkan lokasi perangkat
    locationData = await location.getLocation();
    final latLng = LatLng(locationData.latitude!, locationData.longitude!);

    /*
        Menambahkan fungsi placemarkFromCoordinates setelah mendapatkan
          lokasi perangkat
    */
    final info = await geo.placemarkFromCoordinates(latLng.latitude, latLng.longitude);

    /*
        Ambillah informasi seperti nama jalan dan alamat lengkap berdasarkan
          variabel info. Lalu, simpan informasi lengkap tersebut ke dalam
          variabel placemark
    */
    final place = info[0];
    final street = place.street!;
    final address = '${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';
    setState(() {
      placemark = place;
    });

    defineMarker(latLng, street, address);

    // Arahkan view peta pada lokasi perangkat
    mapController.animateCamera(
      CameraUpdate.newLatLng(latLng),
    );
  }

  /*
      Mendapatkan Alamat Menggunakan Reverse Geocoding

        Saat ini, apabila marker ditekan, Anda tidak dapat mendapatkan info
          lokasi maupun alamat. Marker tidak menampilkan window karena kita
          belum memberikan informasi tersebut.

        Lalu, bagaimana kita bisa menampilkan alamat dari posisi marker ?
          Jawabannya adalah dengan menggunakan Reverse Geocoding. Geocoding
          sendiri merupakan proses untuk mendapatkan titik koordinat dari
          alamat yang sudah ditentukan. Sebaliknya, reverse geocoding
          merupakan proses mendapatkan alamat berdasarkan titik koordinat
          yang ditentukan sebelumnya.
  */
}


/*
    Alamat yang didapatkan melalui proses reverse geocoding akan tampil pada
      window marker. Akan tetapi, alangkah baiknya alamat lokasi dapat
      ditampilkan langsung pada sebuah widget supaya lebih mudah dibaca oleh
      pengguna.
*/
class PlacemarkWidget extends StatelessWidget {

  final geo.Placemark placemark;

  const PlacemarkWidget ({
    super.key,
    required this.placemark,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      constraints: const BoxConstraints(maxWidth: 700),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(50)),
        boxShadow: <BoxShadow>[
          BoxShadow(
            blurRadius: 20,
            offset: Offset.zero,
            color: AppColors.grey.withOpacity(0.5),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  placemark.street!,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Text(
                  '${placemark.subLocality}, ${placemark.locality}, ${placemark.postalCode}, ${placemark.country}',
                  style: Theme.of(context).textTheme.labelLarge,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}