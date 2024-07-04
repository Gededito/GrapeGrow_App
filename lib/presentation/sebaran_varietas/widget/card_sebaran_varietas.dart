import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:grapegrow_apps/core/component/build_context_ext.dart';
import 'package:grapegrow_apps/core/constants/colors.dart';
import 'package:grapegrow_apps/data/models/responses/add_sebaran_varietas_response.dart';
import 'package:grapegrow_apps/presentation/sebaran_varietas/pages/detail_sebaran_varietas.dart';

class CardSebaranVarietas extends StatefulWidget {
  final SebaranVarietas data;

  const CardSebaranVarietas({
    super.key,
    required this.data,
  });

  @override
  State<CardSebaranVarietas> createState() => _CardSebaranVarietasState();
}

class _CardSebaranVarietasState extends State<CardSebaranVarietas> {
  String alamat = "";
  final String fontPoppins = 'FontPoppins';

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
    return GestureDetector(
      onTap: () {
        context.push(DetailSebaranVarietas(data: widget.data));
      },
      child: Container(
        padding: const EdgeInsets.all(4.0),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: [
            BoxShadow(
              color: AppColors.black.withOpacity(0.14),
              blurRadius: 16,
              offset: const Offset(0, 8),
              spreadRadius: 2,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.all(
                  Radius.circular(12.0),
                ),
                child: CachedNetworkImage(
                  imageUrl: 'http://192.168.0.171:8000/storage/${widget.data.gambar}',
                  placeholder: (context, url) => const SizedBox(
                    width: 100,
                    height: 100,
                    child: Center(child: CircularProgressIndicator()),
                  ),
                  errorWidget: (context, url, error) {
                    return const Icon(Icons.error);
                  },
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 16.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.data.nama,
                      style: TextStyle(
                        fontFamily: fontPoppins,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        overflow: TextOverflow.ellipsis,
                      ),
                      maxLines: 1,
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      widget.data.user!.name,
                      style: TextStyle(
                        fontFamily: fontPoppins,
                        fontWeight: FontWeight.w500,
                        overflow: TextOverflow.ellipsis,
                      ),
                      maxLines: 1,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      alamat,
                      style: TextStyle(
                        fontFamily: fontPoppins,
                        overflow: TextOverflow.ellipsis,
                      ),
                      maxLines: 1,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}