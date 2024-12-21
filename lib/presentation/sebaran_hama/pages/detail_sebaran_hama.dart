import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:grapegrow_apps/core/component/build_context_ext.dart';
import 'package:grapegrow_apps/core/constants/colors.dart';
import 'package:grapegrow_apps/data/models/responses/sebaran/add_sebaran_hama_response.dart';
import 'package:grapegrow_apps/core/constants/constant.dart';
import 'package:intl/intl.dart';

class DetailSebaranHama extends StatefulWidget {
  final SebaranHama data;

  const DetailSebaranHama({
    super.key,
    required this.data,
  });

  @override
  State<DetailSebaranHama> createState() => _DetailSebaranHamaState();
}

class _DetailSebaranHamaState extends State<DetailSebaranHama> {
  final String fontPoppins = 'FontPoppins';
  String alamat = "";

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
          'Detail Sebaran Hama',
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
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(
                Radius.circular(12.0),
              ),
              child: CachedNetworkImage(
                imageUrl: '${Variables.baseUrl}/storage/${widget.data.gambar}',
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
                    overflow: TextOverflow.ellipsis
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            Text(
              widget.data.nama,
              style: TextStyle(
                fontFamily: fontPoppins,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 8.0),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Solusi Penanganan',
                  style: TextStyle(
                    fontFamily: fontPoppins,
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 4.0),
                Text(
                  widget.data.solusi,
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
                  'Gejala Yang Dialami',
                  style: TextStyle(
                    fontFamily: fontPoppins,
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 4.0),
                Text(
                  widget.data.gejala,
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
    );
  }
}