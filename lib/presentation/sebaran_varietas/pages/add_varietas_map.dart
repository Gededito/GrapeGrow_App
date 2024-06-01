import 'dart:io';

import 'package:flutter/material.dart';
import 'package:grapegrow_apps/core/component/button_switch_location.dart';
import 'package:grapegrow_apps/core/component/buttons.dart';
import 'package:grapegrow_apps/core/component/custom_input_field.dart';
import 'package:grapegrow_apps/core/component/description_input.dart';
import 'package:grapegrow_apps/core/component/dropdown_input.dart';
import 'package:grapegrow_apps/core/component/image_input.dart';
import 'package:grapegrow_apps/core/constants/colors.dart';

class AddVarietasMap extends StatefulWidget {
  const AddVarietasMap({super.key});

  @override 
  State<AddVarietasMap> createState() => _AddVarietasMapState();
}

class _AddVarietasMapState extends State<AddVarietasMap> {
  final fontPoppins = 'FontPoppins';

  bool _isLocationInputEnabled = false;
  final locationController = TextEditingController();
  final varietasController = TextEditingController();
  final deskripsiController = TextEditingController();

  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Tambahkan Varietas Di Map',
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              CustomInputField(
                label: 'Varietas Anggur ?',
                controller: varietasController,
                toggleObscureText: null,
                labelText: 'Nama varietas anggur',
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(height: 12),
              CustomInputField(
                label: 'Luas Lahan ? (m2)',
                controller: varietasController,
                toggleObscureText: null,
                labelText: 'Masukan luas lahan',
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(height: 12),
              DropdownInput(
                label: 'Apakah Jual Bibit ?',
                items: const ['Pilih','Iya', 'Tidak'],
                onChanged: (value) {
                  // print('Pilihan yang dipilih: $value');
                },
                initialValue: 'Pilih',
              ),
              const SizedBox(height: 12),
              DescriptionInput(
                label: 'Tuliskan Deskripsi',
                controller: deskripsiController,
              ),
              const SizedBox(height: 12),
              ImageInput(
                label: 'Masukan Gambar',
                onImageSelected: (File? file) {},
              ),
              const SizedBox(height: 12),
              LocationInputSwitch(
                onSwitchChanged: (isEnabled) {

                  /*
                      Lanjutkan Untuk Melakukan Input Lokasi
                  */

                  setState(() {
                    _isLocationInputEnabled = isEnabled;
                  });
                },
              ),
              const SizedBox(height: 40),
              Button.filled(
                onPressed: () {},
                label: 'Tambahkan',
              ),
              const SizedBox(height: 12),
              Button.outlined(
                onPressed: () {},
                label: 'Batalkan',
              ),
            ],
          ),
        ),
      ),
    );
  }
}