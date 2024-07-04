import 'dart:async';

import 'package:flutter/material.dart';
import 'package:grapegrow_apps/core/constants/colors.dart';
import 'package:grapegrow_apps/presentation/auth/pages/login_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final String fontPoppins = 'FontPoppins';

  @override
  void initState() {
    super.initState();

    // Timer untuk durasi splash screen
    Timer(const Duration(seconds: 10), () {
      Navigator.push(context, MaterialPageRoute(
        builder: (context) => const LoginPage()
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF728AB9),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/splash_screen.jpg',
              width: 150,
              height: 150,
            ),
            const SizedBox(height: 20),
            Text(
              "GrapeGrow App",
              style: TextStyle(
                color: AppColors.white,
                fontFamily: fontPoppins,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}