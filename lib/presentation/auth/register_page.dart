import 'dart:io';

import 'package:flutter/material.dart';
import 'package:grapegrow_apps/core/component/buttons.dart';
import 'package:grapegrow_apps/core/component/custom_input_field.dart';
import 'package:grapegrow_apps/core/constants/colors.dart';
import 'package:grapegrow_apps/main.dart';
import 'package:grapegrow_apps/presentation/auth/login_page.dart';
import 'package:image_picker/image_picker.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final String fontPoppins = 'FontPoppins';

  final namaController = TextEditingController();
  final nomorWaController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  File? _image;
  bool obscureText = true;

  void toggleObscureText() {
    setState(() {
      obscureText = !obscureText;
    });
  }

  Future _getImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _image = File(image.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 80.0,
          ),
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Daftarkan Akunmu Sekarang!',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: fontPoppins,
                    fontWeight: FontWeight.w500,
                    color: AppColors.primary,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8.0),
                GestureDetector(
                  onTap: _getImage,
                  child: CircleAvatar(
                    radius: 60,
                    backgroundImage: _image != null ? FileImage(_image!) : null,
                    backgroundColor: AppColors.grey.withOpacity(0.5),
                    child: _image == null ? const Icon(Icons.add_a_photo, color: AppColors.white) : null,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40.0),
            CustomInputField(
              label: 'Masukan Nama Anda',
              controller: namaController,
              toggleObscureText: null,
              prefIcon: const Icon(Icons.person),
              labelText: 'Masukan Nama Anda',
              textInputAction: TextInputAction.next,
            ),
            const SizedBox(height: 24.0),
            CustomInputField(
              label: 'Masukan No Whatshapp',
              controller: nomorWaController,
              toggleObscureText: null,
              prefIcon: const Icon(Icons.dialpad),
              labelText: 'Nomor Whatshapp',
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.next,
            ),
            const SizedBox(height: 24.0),
            CustomInputField(
              label: 'Masukan Email Anda',
              controller: emailController,
              toggleObscureText: null,
              prefIcon: const Icon(Icons.email),
              labelText: 'Masukan Email Anda',
              textInputAction: TextInputAction.next,
            ),
            const SizedBox(height: 24.0),
            CustomInputField(
              label: 'Masukan Password Anda',
              controller: passwordController,
              obscureText: obscureText,
              toggleObscureText: toggleObscureText,
              prefIcon: const Icon(Icons.lock),
              labelText: 'Masukan Password Anda',
              textInputAction: TextInputAction.done,
              isNonPasswordField: false,
            ),
            const SizedBox(height: 50.0),
            Button.filled(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DashboardPage()
                  )
                );
              },
              label: 'Daftar',
            ),
            const SizedBox(height: 20.0),
            Button.outlined(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginPage(),
                  )
                );
              },
              label: 'Masuk',
            ),
          ],
        ),
      ),
    );
  }
}