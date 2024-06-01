import 'dart:io';

import 'package:flutter/material.dart';
import 'package:grapegrow_apps/core/component/buttons.dart';
import 'package:grapegrow_apps/core/component/description_input.dart';
import 'package:grapegrow_apps/core/component/image_input.dart';
import 'package:grapegrow_apps/core/constants/colors.dart';

class AddForum extends StatefulWidget {
  const AddForum({super.key});

  @override 
  State<AddForum> createState() => _AddForumState();
}

class _AddForumState extends State<AddForum> {
  final String fontPoppins = 'FontPoppins';
  
  final pertanyaanController = TextEditingController();

  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Diskusi Baru',
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              DescriptionInput(
                label: 'Pertanyaan',
                controller: pertanyaanController,
              ),
              const SizedBox(
                height: 12,
              ),
              ImageInput(
                label: 'Masukan Gambar',
                onImageSelected: (File? file) {},
              ),
              const SizedBox(height: 40),
              Button.filled(
                onPressed: () {},
                label: 'Tambahkan',
              ),
              const SizedBox(
                height: 12,
              ),
              Button.outlined(
                onPressed: () {},
                label: 'Batalkan',
              )
            ],
          ),
        ),
      ),
    );
  }
}