import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:grapegrow_apps/core/component/build_context_ext.dart';
import 'package:grapegrow_apps/core/constants/colors.dart';
import 'package:grapegrow_apps/data/models/responses/hama_response_model.dart';

class DetailHamaPage extends StatelessWidget {
  final String fontPoppins = 'FontPoppins';

  final Hama data;

  const DetailHamaPage({
    super.key,
    required this.data,
  });

  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Detail Penyakit Dan Hama',
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
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(
                Radius.circular(12.0),
              ),
              child: CachedNetworkImage(
                imageUrl: 'http://192.168.0.171:8000/storage/${data.gambar}',
                placeholder: (context, url) => SizedBox(
                  height: 300,
                  width: context.deviceWidth,
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
                errorWidget: (context, url, error) {
                  return const Icon(Icons.error);
                },
                height: 300,
                width: context.deviceWidth,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 12.0),
            Text(
              data.nama,
              style: TextStyle(
                fontSize: 18,
                fontFamily: fontPoppins,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              'Gejala',
              style: TextStyle(
                fontSize: 16,
                fontFamily: fontPoppins,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 4.0),
            Text(
              data.gejala,
              style: TextStyle(
                fontSize: 12,
                fontFamily: fontPoppins,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              'Tindakan Pencegahan',
              style: TextStyle(
                fontSize: 16,
                fontFamily: fontPoppins,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 4.0),
            Text(
              data.solusi,
              style: TextStyle(
                fontSize: 12,
                fontFamily: fontPoppins,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              'Apa Penyebabnya ?',
              style: TextStyle(
                fontSize: 16,
                fontFamily: fontPoppins,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 4.0),
            Text(
              data.penyebab,
              style: TextStyle(
                fontSize: 12,
                fontFamily: fontPoppins,
              ),
            ),
          ],
        ),
      ),
    );
  }
}