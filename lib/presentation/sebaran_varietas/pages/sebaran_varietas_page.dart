import 'package:flutter/material.dart';
import 'package:grapegrow_apps/core/component/build_context_ext.dart';
import 'package:grapegrow_apps/core/constants/colors.dart';
import 'package:grapegrow_apps/presentation/sebaran_varietas/model/sebaran_varietas_model.dart';
import 'package:grapegrow_apps/presentation/sebaran_varietas/pages/varietas_map.dart';
import 'package:grapegrow_apps/widgets/sebaran_card.dart';

class SebaranVarietasPage extends StatefulWidget {
  const SebaranVarietasPage({super.key});

  @override 
  State<SebaranVarietasPage> createState() => _SebaranVarietasPageState();
}

class _SebaranVarietasPageState extends State<SebaranVarietasPage> {
  final String fontPoppins = 'FontPoppins';

  final List<SebaranVarietasModel> sebaranVarietas = [
    SebaranVarietasModel(
      namaVarietas: 'Varietas Anggur 1',
      owner: 'Pemilik Lahan 1',
      imageVarietas: 'assets/images/testing_1.jpg',
      jarak: 90
    ),
    SebaranVarietasModel(
      namaVarietas: 'Varietas Anggur 2',
      owner: 'Pemilik Lahan 2',
      imageVarietas: 'assets/images/testing_2.jpg',
      jarak: 80,
    ),
    SebaranVarietasModel(
      namaVarietas: 'Varietas Anggur 3',
      owner: 'Pemilik Lahan 3',
      imageVarietas: "assets/images/testing_3.jpg",
      jarak: 70,
    ),
    SebaranVarietasModel(
      namaVarietas: 'Varietas Anggur 4',
      owner: 'Pemilik Lahan 4',
      imageVarietas: 'assets/images/testing_1.jpg',
      jarak: 60,
    ),
    SebaranVarietasModel(
        namaVarietas: 'Varietas Anggur 5',
        owner: 'Pemilik Lahan 5',
        imageVarietas: 'assets/images/testing_1.jpg',
        jarak: 90
    ),
    SebaranVarietasModel(
      namaVarietas: 'Varietas Anggur 6',
      owner: 'Pemilik Lahan 6',
      imageVarietas: 'assets/images/testing_2.jpg',
      jarak: 80,
    ),
    SebaranVarietasModel(
      namaVarietas: 'Varietas Anggur 7',
      owner: 'Pemilik Lahan 7',
      imageVarietas: 'assets/images/testing_3.jpg',
      jarak: 70,
    ),
    SebaranVarietasModel(
      namaVarietas: 'Varietas Anggur 8',
      owner: 'Pemilik Lahan 8',
      imageVarietas: 'assets/images/testing_1.jpg',
      jarak: 60,
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
        itemBuilder: (context, int index) {
          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 8.0,
              vertical: 2.0,
            ),
            child: SebaranCard(
              name: sebaranVarietas[index].namaVarietas,
              owner: sebaranVarietas[index].owner,
              jarak: sebaranVarietas[index].jarak,
              imagePath: sebaranVarietas[index].imageVarietas,
              onTap: () {},
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.push(const VarietasMap());
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