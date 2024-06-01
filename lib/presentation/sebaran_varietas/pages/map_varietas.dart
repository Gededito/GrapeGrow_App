import 'package:flutter/material.dart';
import 'package:grapegrow_apps/core/constants/colors.dart';
import 'package:grapegrow_apps/presentation/sebaran_varietas/pages/add_varietas_map.dart';

class MapVarietas extends StatefulWidget {
  const MapVarietas({super.key});

  @override 
  State<MapVarietas> createState() => _MapVarietasState();
}

class _MapVarietasState extends State<MapVarietas> {
  final String fontPoppins = 'FontPoppins';

  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Map Sebaran Varietas',
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddVarietasMap()
            ),
          );
        },
        backgroundColor: AppColors.white,
        child: const Icon(
          Icons.add,
          size: 40,
          color: AppColors.primary,
        ),
      ),
    );
  }
}