import 'dart:io';

import 'package:flutter/material.dart';
import 'package:grapegrow_apps/core/component/button_switch_location.dart';
import 'package:grapegrow_apps/core/component/buttons.dart';
import 'package:grapegrow_apps/core/component/custom_input_field.dart';
import 'package:grapegrow_apps/core/component/description_input.dart';
import 'package:grapegrow_apps/core/component/image_input.dart';
import 'package:grapegrow_apps/core/constants/colors.dart';

class AddHamaMap extends StatefulWidget {
  const AddHamaMap({super.key});

  @override 
  State<AddHamaMap> createState() => _AddHamaMapState();
}

class _AddHamaMapState extends State<AddHamaMap> {
  final String fontPoppins = 'FontPoppins';

  bool _isLocationInputEnabled = false;
  final jenisOptController = TextEditingController();
  final solusiController = TextEditingController();
  final locationController = TextEditingController();

  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Tambahkan Hama Di Map',
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
                label: 'Nama Jenis Penyakit Atau Hama ?',
                controller: jenisOptController,
                toggleObscureText: null,
                labelText: 'Nama Penyakit Atau Hama',
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(height: 12),
              DescriptionInput(
                label: 'Cara Penyelesainnya ?',
                controller: solusiController,
              ),
              const SizedBox(height: 12),
              ImageInput(
                label: 'Masukan Bukti Foto',
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