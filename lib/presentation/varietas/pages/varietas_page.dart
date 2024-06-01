import 'package:flutter/material.dart';
import 'package:grapegrow_apps/core/constants/colors.dart';
import 'package:grapegrow_apps/presentation/varietas/model/varietas_model.dart';
import 'package:grapegrow_apps/presentation/varietas/pages/detail_varietas_page.dart';
import 'package:grapegrow_apps/widgets/list_item_card.dart';

class VarietasPage extends StatefulWidget {
  const VarietasPage({super.key});

  @override
  State<VarietasPage> createState() => _VarietasPageState();
}

class _VarietasPageState extends State<VarietasPage> {
  final String fontPoppins = 'FontPoppins';

  final List<VarietasModel> varietas = [
    VarietasModel(
      namaVarietas: 'Nama Varietas 1',
      imageVarietas: 'assets/images/testing_1.jpg',
      descVarietas: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
    ),
    VarietasModel(
      namaVarietas: 'Nama Varietas 2',
      imageVarietas: 'assets/images/testing_2.jpg',
      descVarietas: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
    ),
    VarietasModel(
      namaVarietas: 'Nama Varietas 3',
      imageVarietas: 'assets/images/testing_3.jpg',
      descVarietas: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
    ),
    VarietasModel(
      namaVarietas: 'Nama Varietas 4',
      imageVarietas: 'assets/images/testing_1.jpg',
      descVarietas: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
    ),
    VarietasModel(
      namaVarietas: 'Nama Varietas 5',
      imageVarietas: 'assets/images/testing_2.jpg',
      descVarietas: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
    ),
    VarietasModel(
      namaVarietas: 'Nama Varietas 6',
      imageVarietas: 'assets/images/testing_3.jpg',
      descVarietas: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
    ),
    VarietasModel(
      namaVarietas: 'Nama Varietas 7',
      imageVarietas: 'assets/images/testing_1.jpg',
      descVarietas: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
    ),
    VarietasModel(
      namaVarietas: 'Nama Varietas 8',
      imageVarietas: 'assets/images/testing_2.jpg',
      descVarietas: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
    ),
    VarietasModel(
      namaVarietas: 'Nama Varietas 9',
      imageVarietas: 'assets/images/testing_3.jpg',
      descVarietas: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Varietas Anggur',
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
        itemCount: varietas.length,
        shrinkWrap: true,
        itemBuilder: (context, int index) {
          return Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 4.0,
              horizontal: 8.0,
            ),
            child: ListItemCard(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailVarietasPage(data: varietas[index]),
                  ),
                );
              },
              name: varietas[index].namaVarietas,
              desc: varietas[index].descVarietas,
              imagePath: varietas[index].imageVarietas,
            ),
          );
        },
      ),
    );
  }
}