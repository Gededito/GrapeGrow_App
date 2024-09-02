import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:grapegrow_apps/core/component/build_context_ext.dart';
import 'package:grapegrow_apps/core/constants/colors.dart';
import 'package:grapegrow_apps/core/constants/constant.dart';
import 'package:grapegrow_apps/data/models/responses/add_sebaran_varietas_response.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailSebaranVarietas extends StatefulWidget {
  final SebaranVarietas data;

  const DetailSebaranVarietas({
    required this.data,
    super.key,
  });

  @override
  State<DetailSebaranVarietas> createState() => _DetailSebaranVarietasState();
}

class _DetailSebaranVarietasState extends State<DetailSebaranVarietas> {
  final String fontPoppins = 'FontPoppins';
  String alamat = "";

  // Fungsi Untuk Mengirimkan Pesan Whatshapp
  Future<void> _launchWhatsApp() async {
    var phoneNumber = widget.data.user!.phone;
    var message =
        "Hallo, Saya *${widget.data.user!.name}* ingin bertanya mengenai Penjualan Bibit *${widget.data.nama}*, Apakah masih tersedia ?";

    final url = Uri.parse("https://wa.me/$phoneNumber/?text=${Uri.parse(message)}");

    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch WhatsApp';
    }
  }

  // Fungsi Membaca Alamat Pengguna Dari Lat dan Lon Pada Database
  Future<void> _getAddress() async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(widget.data.lat, widget.data.lon);
      Placemark place = placemarks[0];
      setState(() {
        alamat = "${place.street}, ${place.subLocality},"
            "${place.locality}, ${place.country}";
      });
    } catch (e) {
      alamat = "Tidak Menampilkan Alamat";
    }
  }

  @override
  void initState() {
    super.initState();
    _getAddress();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Detail Sebaran Varietas',
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
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(
                Radius.circular(12.0),
              ),
              child: CachedNetworkImage(
                imageUrl:'${Variables.baseUrl}/storage/${widget.data.gambar}',
                placeholder: (context, url) => SizedBox(
                  height: 250,
                  width: context.deviceWidth,
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
                errorWidget: (context, url, error) {
                  return const Icon(Icons.error);
                },
                height: 250,
                width: context.deviceWidth,
                fit: BoxFit.fill,
              ),
            ),
            const SizedBox(height: 12.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(50.0),
                      ),
                      child: Image.network(
                        'https://i.pravatar.cc/200',
                        width: 40.0,
                        height: 40.0,
                      ),
                    ),
                    const SizedBox(width: 8.0),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.data.user!.name.length > 20
                          ? '${widget.data.user!.name.substring(0, 20)}...'
                          : widget.data.user!.name,
                          style: TextStyle(
                            fontFamily: fontPoppins,
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            overflow: TextOverflow.ellipsis,
                          ),
                          maxLines: 1,
                        ),
                        SizedBox(
                          width: 200,
                          child: Text(
                            alamat,
                            style: TextStyle(
                              fontFamily: fontPoppins,
                              fontSize: 12,
                              color: AppColors.grey,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Text(
                  DateFormat('dd MMMM yyyy').format(widget.data.createdAt),
                  style: TextStyle(
                    fontFamily: fontPoppins,
                    fontSize: 12,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            Text(
              widget.data.nama,
              style: TextStyle(
                fontFamily: fontPoppins,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 8.0),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Jumlah Tanaman',
                  style: TextStyle(
                    fontFamily: fontPoppins,
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 4.0),
                Text(
                  widget.data.jumlahTanaman.toString(),
                  style: TextStyle(
                    fontFamily: fontPoppins,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8.0),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Deskripsi',
                  style: TextStyle(
                    fontFamily: fontPoppins,
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 4.0),
                Text(
                  widget.data.deskripsi,
                  style: TextStyle(
                    fontFamily: fontPoppins,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8.0),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Jual Bibit',
                  style: TextStyle(
                    fontFamily: fontPoppins,
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 4.0),
                Text(
                  widget.data.jualBibit == true ? "Iya" : "Tidak",
                  style: TextStyle(
                    fontFamily: fontPoppins,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: Visibility(
        visible: widget.data.jualBibit != false,
        child: FloatingActionButton.extended(
          backgroundColor: AppColors.primary,
          onPressed: () {
            _launchWhatsApp();
          },
          label: Text(
            "Hubungi",
            style: TextStyle(
              fontFamily: fontPoppins,
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: AppColors.white,
            ),
          ),
          icon: const Icon(
            Icons.phone,
            color: AppColors.white,
          ),
        ),
      ),
    );
  }
}