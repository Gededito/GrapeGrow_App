import 'package:flutter/material.dart';
import 'package:grapegrow_apps/core/constants/colors.dart';
import 'package:grapegrow_apps/presentation/sebaran_hama/model/sebaran_hama_model.dart';
import 'package:grapegrow_apps/widgets/sebaran_card.dart';

class SebaranHamaPage extends StatefulWidget {
  const SebaranHamaPage({super.key});

  @override
  State<SebaranHamaPage> createState() => _SebaranHamaPageState();
}

class _SebaranHamaPageState extends State<SebaranHamaPage> {
  final String fontPoppins = 'FontPoppins';

  final List<SebaranHamaModel> sebaranHama = [
    SebaranHamaModel(
      namaHama: 'Hama Anggur 1',
      owner: 'Pemilik Lahan 1',
      imageHama: 'assets/images/testing_1.jpg',
      jarak: 90,
    ),
    SebaranHamaModel(
      namaHama: 'Hama Anggur 2',
      owner: 'Pemilik Lahan 2',
      imageHama: 'assets/images/testing_2.jpg',
      jarak: 80,
    ),
    SebaranHamaModel(
      namaHama: 'Hama Anggur 3',
      owner: 'Pemilik Lahan 3',
      imageHama: 'assets/images/testing_3.jpg',
      jarak: 70,
    ),
    SebaranHamaModel(
      namaHama: 'Hama Anggur 4',
      owner: 'Pemilik Lahan 4',
      imageHama: 'assets/images/testing_1.jpg',
      jarak: 90,
    ),
    SebaranHamaModel(
      namaHama: 'Hama Anggur 5',
      owner: 'Pemilik Lahan 5',
      imageHama: 'assets/images/testing_2.jpg',
      jarak: 80,
    ),
    SebaranHamaModel(
      namaHama: 'Hama Anggur 6',
      owner: 'Pemilik Lahan 6',
      imageHama: 'assets/images/testing_3.jpg',
      jarak: 70,
    ),
    SebaranHamaModel(
      namaHama: 'Hama Anggur 7',
      owner: 'Pemilik Lahan 7',
      imageHama: 'assets/images/testing_1.jpg',
      jarak: 60,
    ),
    SebaranHamaModel(
      namaHama: 'Hama Anggur 8',
      owner: 'Pemilik Lahan  8',
      imageHama: 'assets/images/testing_2.jpg',
      jarak: 90,
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
        itemBuilder: (context, int index) {
          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 8.0,
              vertical: 2.0,
            ),
            child: SebaranCard(
              name: sebaranHama[index].namaHama,
              owner: sebaranHama[index].owner,
              jarak: sebaranHama[index].jarak,
              imagePath: sebaranHama[index].imageHama,
              onTap: () {},
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
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