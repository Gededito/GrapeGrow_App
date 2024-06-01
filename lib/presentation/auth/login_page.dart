import 'package:flutter/material.dart';
import 'package:grapegrow_apps/core/component/buttons.dart';
import 'package:grapegrow_apps/core/component/custom_input_field.dart';
import 'package:grapegrow_apps/core/constants/colors.dart';
import 'package:grapegrow_apps/main.dart';
import 'package:grapegrow_apps/presentation/auth/register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override 
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final String fontPoppins = 'FontPoppins';

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool obscureText = true;

  void toggleObscureText() {
    setState(() {
      obscureText = !obscureText;
    });
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
                Container(
                  height: 150.0,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        'assets/images/testing_1.jpg',
                      ),
                    )
                  ),
                ),
                const SizedBox(height: 8.0),
                Text(
                  'Silahkan Masukan Sesuai Akun Anda',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: fontPoppins,
                    fontWeight: FontWeight.w500,
                    color: AppColors.primary,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            const SizedBox(height: 40.0),
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
                Navigator.push(context,
                  MaterialPageRoute(
                    builder: (context) => const DashboardPage()
                  )
                );
              },
              label: 'Masuk',
            ),
            const SizedBox(height: 20.0),
            Button.outlined(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const RegisterPage(),
                  ),
                );
              },
              label: 'Daftar',
            ),
          ],
        ),
      ),
    );
  }
}