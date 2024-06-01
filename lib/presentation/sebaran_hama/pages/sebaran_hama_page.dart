import 'package:flutter/material.dart';
import 'package:grapegrow_apps/core/component/build_context_ext.dart';
import 'package:grapegrow_apps/core/constants/colors.dart';
import 'package:grapegrow_apps/presentation/sebaran_hama/model/sebaran_hama_model.dart';
import 'package:grapegrow_apps/presentation/sebaran_hama/pages/detail_sebaran_hama.dart';
import 'package:grapegrow_apps/presentation/sebaran_hama/pages/map_hama.dart';
import 'package:grapegrow_apps/presentation/sebaran_hama/widget/card_sebaran_hama.dart';

class SebaranHamaPage extends StatefulWidget {

  const SebaranHamaPage({super.key});

  @override
  State<SebaranHamaPage> createState() => _SebaranHamaPageState();
}

class _SebaranHamaPageState extends State<SebaranHamaPage> {
  final String fontPoppins = 'FontPoppins';

  final List<SebaranHamaModel> sebaranHama = [
    SebaranHamaModel(
      namaOpt: 'Kutu Daun',
      namaPemilik: 'Albert Anthonius',
      imageHama: 'assets/images/testing_1.jpg',
      alamat: 'Balaraja, Kabupaten Tangerang',
      solusiPenanganan: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
    ),
    SebaranHamaModel(
      namaOpt: 'Leafroll Virus',
      namaPemilik: 'Akmal Christhoper',
      imageHama: 'assets/images/testing_2.jpg',
      alamat: 'Bintaro, Tangerang Selatan',
      solusiPenanganan: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
    ),
    SebaranHamaModel(
      namaOpt: 'Downy Mildew',
      namaPemilik: 'Maulana Fauzan',
      imageHama: 'assets/images/testing_3.jpg',
      alamat: 'Pamulang, Tangerang Selatan',
      solusiPenanganan: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
    ),
    SebaranHamaModel(
      namaOpt: 'Anthracnose',
      namaPemilik: 'Made Cahya',
      imageHama: 'assets/images/testing_1.jpg',
      alamat: 'Ciputat, Tangerang Selatan',
      solusiPenanganan: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
    ),
    SebaranHamaModel(
      namaOpt: 'Botrytis Cinerea',
      namaPemilik: 'Made Fajar',
      imageHama: 'assets/images/testing_2.jpg',
      alamat: 'Pondok Aren, Tangerang Selatan',
      solusiPenanganan: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
    ),
    SebaranHamaModel(
      namaOpt: 'Fanleaf Virus',
      namaPemilik: 'Gede Bayu',
      imageHama: 'assets/images/testing_3.jpg',
      alamat: 'Karawaci, Tangerang Selatan',
      solusiPenanganan: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Sebaran Hama Anggur',
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
      body: ListView.builder(
        itemCount: sebaranHama.length,
        shrinkWrap: true,
        itemBuilder: (context, int index) {
          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 8.0,
              vertical: 3.0,
            ),
            child: CardSebaranHama(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailSebaranHama(data: sebaranHama[index]),
                  )
                );
              },
              data: sebaranHama[index],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.push(const MapHama());
        },
        backgroundColor: AppColors.white,
        child: const Icon(
          Icons.location_on_outlined,
          size: 30,
          color: AppColors.primary,
        ),
      ),
    );
  }
}