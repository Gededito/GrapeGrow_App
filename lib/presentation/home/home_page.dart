import 'package:flutter/material.dart';
import 'package:grapegrow_apps/core/component/build_context_ext.dart';
import 'package:grapegrow_apps/core/constants/colors.dart';
import 'package:grapegrow_apps/data/datasources/auth_local_datasource.dart';
import 'package:grapegrow_apps/data/models/responses/auth_response_model.dart';
import 'package:grapegrow_apps/presentation/hama/pages/hama_page.dart';
import 'package:grapegrow_apps/presentation/sebaran_hama/pages/sebaran_hama_page.dart';
import 'package:grapegrow_apps/presentation/sebaran_varietas/pages/sebaran_varietas_page.dart';
import 'package:grapegrow_apps/presentation/varietas/pages/varietas_page.dart';
import 'package:grapegrow_apps/widgets/category_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final String fontPoppins = 'FontPoppins';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        centerTitle: false,
        toolbarHeight: 80,
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.primary,
        title: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Selamat Datang',
                  style: TextStyle(
                    fontFamily: fontPoppins,
                    fontSize: 12,
                    color: AppColors.white,
                  ),
                ),
                FutureBuilder<AuthResponseModel>(
                  future: AuthLocalDatasource().getAuthData(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Text(
                        snapshot.data!.user.name,
                        style: TextStyle(
                          fontFamily: fontPoppins,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          overflow: TextOverflow.ellipsis,
                          color: AppColors.white
                        ),
                      );
                    } else {
                      return const SizedBox();
                    }
                  }
                ),
              ],
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 4.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Fitur Utama',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16.0,
                  fontFamily: fontPoppins,
                ),
              ),
              const SizedBox(height: 8.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: CategoryCard(
                      imagePath: "assets/icons/icon_anggur.svg",
                      name: 'Varietas Anggur',
                      onPressed: () {
                        context.push(const VarietasPage());
                      },
                    ),
                  ),
                  Flexible(
                    child: CategoryCard(
                      imagePath: 'assets/icons/icon_modul.svg',
                      name: 'Modul Budidaya',
                      onPressed: () {},
                    ),
                  ),
                  Flexible(
                    child: CategoryCard(
                      imagePath: 'assets/icons/icon_hama.svg',
                      name: 'Hama & Penyakit',
                      onPressed: () {
                        context.push(const HamaPage());
                      },
                    ),
                  ),
                  Flexible(
                    child: CategoryCard(
                      imagePath: 'assets/icons/icon_cuaca.svg',
                      name: 'Prediksi Cuaca',
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Flexible(
                    child: CategoryCard(
                      imagePath: 'assets/icons/icon_maps.svg',
                      name: 'Sebaran Varietas Anggur',
                      onPressed: () {
                        context.push(const SebaranVarietasPage());
                      },
                    ),
                  ),
                  Flexible(
                    child: CategoryCard(
                      imagePath: 'assets/icons/icon_penyakit.svg',
                      name: 'Sebaran Hama & Penyakit',
                      onPressed: () {
                        context.push(const SebaranHamaPage());
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}