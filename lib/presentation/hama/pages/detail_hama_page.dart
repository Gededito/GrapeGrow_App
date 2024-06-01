import 'package:flutter/material.dart';
import 'package:grapegrow_apps/core/component/build_context_ext.dart';
import 'package:grapegrow_apps/core/constants/colors.dart';
import 'package:grapegrow_apps/presentation/hama/model/hama_model.dart';

class DetailHamaPage extends StatelessWidget {
  final String fontPoppins = 'FontPoppins';

  final HamaModel data;

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
              borderRadius: BorderRadius.circular(12.0),
              child: Image.asset(
                data.imageHama,
                width: context.deviceWidth,
                height: 300,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 12.0),
            Text(
              data.namaHama,
              style: TextStyle(
                fontSize: 16,
                fontFamily: fontPoppins,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              'Gejala',
              style: TextStyle(
                fontSize: 14,
                fontFamily: fontPoppins,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 4.0),
            Text(
              data.gejalaHama,
              style: TextStyle(
                fontSize: 12,
                fontFamily: fontPoppins,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              'Tindakan Pencegahan',
              style: TextStyle(
                fontSize: 14,
                fontFamily: fontPoppins,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 4.0),
            Text(
              data.solusiHama,
              style: TextStyle(
                fontSize: 12,
                fontFamily: fontPoppins,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              'Apa Penyebabnya ?',
              style: TextStyle(
                fontSize: 14,
                fontFamily: fontPoppins,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 4.0),
            Text(
              data.penyebabHama,
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