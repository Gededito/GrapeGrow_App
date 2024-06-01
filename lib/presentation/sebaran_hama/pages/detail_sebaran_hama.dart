import 'package:flutter/material.dart';
import 'package:grapegrow_apps/core/component/build_context_ext.dart';
import 'package:grapegrow_apps/core/constants/colors.dart';
import 'package:grapegrow_apps/presentation/sebaran_hama/model/sebaran_hama_model.dart';

class DetailSebaranHama extends StatelessWidget {
  final String fontPoppins = 'FontPoppins';

  final SebaranHamaModel data;

  const DetailSebaranHama({
    super.key,
    required this.data,
  });

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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
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
                          data.namaPemilik,
                          style: TextStyle(
                            fontFamily: fontPoppins,
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            overflow: TextOverflow.ellipsis,
                          ),
                          maxLines: 1,
                        ),
                        Text(
                          data.alamat,
                          style: TextStyle(
                            fontFamily: fontPoppins,
                            fontSize: 12,
                            color: AppColors.grey,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Text(
                  '31 Mei 2023',
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
              data.namaOpt,
              style: TextStyle(
                fontFamily: fontPoppins,
                fontSize: 20,
                fontWeight: FontWeight.w600,
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
                  data.solusiPenanganan,
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