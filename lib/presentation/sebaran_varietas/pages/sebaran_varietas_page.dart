import 'package:flutter/material.dart';
import 'package:grapegrow_apps/core/component/build_context_ext.dart';
import 'package:grapegrow_apps/core/constants/colors.dart';
import 'package:grapegrow_apps/presentation/sebaran_varietas/model/sebaran_varietas_model.dart';
import 'package:grapegrow_apps/presentation/sebaran_varietas/pages/detail_sebaran_varietas.dart';
import 'package:grapegrow_apps/presentation/sebaran_varietas/pages/map_varietas.dart';
import 'package:grapegrow_apps/presentation/sebaran_varietas/widget/card_sebaran_varietas.dart';

class SebaranVarietasPage extends StatefulWidget {
  const SebaranVarietasPage({super.key});

  @override 
  State<SebaranVarietasPage> createState() => _SebaranVarietasPageState();
}

class _SebaranVarietasPageState extends State<SebaranVarietasPage> {
  final String fontPoppins = 'FontPoppins';

  final List<SebaranVarietasModel> sebaranVarietas = [
    SebaranVarietasModel(
      namaVarietas: 'Anggur Julian',
      namaPemilik: 'Albert Anthonius',
      alamat: 'Balaraja, Kabupaten Tangerang',
      imageVarietas: 'assets/images/testing_1.jpg',
      luasLahan: 200,
      descVarietas: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
    ),
    SebaranVarietasModel(
      namaVarietas: 'Anggur Ninel',
      namaPemilik: 'Anggur Christhoper',
      alamat: 'Bintaro, Tangerang Selatan',
      imageVarietas: 'assets/images/testing_2.jpg',
      luasLahan: 200,
      descVarietas: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
    ),
    SebaranVarietasModel(
      namaVarietas: 'Anggur Jupiter',
      namaPemilik: 'Maulana Fauzan',
      alamat: 'Pamulang, Tangerang Selatan',
      imageVarietas: 'assets/images/testing_3.jpg',
      luasLahan: 200,
      descVarietas: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
    ),
    SebaranVarietasModel(
      namaVarietas: 'Anggur Transfigurasi',
      namaPemilik: 'Made Cahya',
      alamat: 'Ciputat',
      imageVarietas: 'assets/images/testing_1.jpg',
      luasLahan: 200,
      descVarietas: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
    ),
    SebaranVarietasModel(
      namaVarietas: 'Anggur Harlod',
      namaPemilik: 'Putu Romy',
      alamat: 'Serpong, Tangerang Selatan',
      imageVarietas: 'assets/images/testing_2.jpg',
      luasLahan: 200,
      descVarietas: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
    ),
    SebaranVarietasModel(
      namaVarietas: 'Anggur Dixon',
      namaPemilik: 'Made Fajar',
      alamat: 'Pondok Aren, Tangerang Selatan',
      imageVarietas: 'assets/images/testing_3.jpg',
      luasLahan: 200,
      descVarietas: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
    ),
    SebaranVarietasModel(
      namaVarietas: 'Anggur Victor',
      namaPemilik: 'Gede Bayu',
      alamat: 'Karawaci, Tangerang Selatan',
      imageVarietas: 'assets/images/testing_1.jpg',
      luasLahan: 200,
      descVarietas: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
    ),
  ];

  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Sebaran Varietas Anggur',
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
        itemCount: sebaranVarietas.length,
        shrinkWrap: true,
        itemBuilder: (context, int index) {
          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 8.0,
              vertical: 3.0,
            ),
            child: CardSebaranVarietas(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailSebaranVarietas(data: sebaranVarietas[index]),
                  )
                );
              },
              data: sebaranVarietas[index],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.push(const MapVarietas());
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