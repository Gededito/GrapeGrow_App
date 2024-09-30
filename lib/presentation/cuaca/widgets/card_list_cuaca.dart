import 'package:flutter/material.dart';
import 'package:grapegrow_apps/core/constants/colors.dart';

class CardListCuaca extends StatelessWidget {
  final String fontPoppins = 'FontPoppins';

  final String imagePath;
  final String suhu;
  final String kondisinya;
  final String hari;
  final String tanggal;

  const CardListCuaca({
    super.key,
    required this.imagePath,
    required this.suhu,
    required this.kondisinya,
    required this.hari,
    required this.tanggal,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 12.0,
      ),
      decoration: BoxDecoration(
        color: const Color(0xff005644),
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.2),
            blurRadius: 16,
            offset: const Offset(2, 4),
            spreadRadius: 2,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset(
                imagePath,
                width: 60,
                height: 60,
              ),
              const SizedBox(
                width: 8.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    suhu,
                    style: TextStyle(
                      fontFamily: fontPoppins,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: AppColors.white,
                    ),
                  ),
                  Text(
                    kondisinya,
                    style: TextStyle(
                      fontFamily: fontPoppins,
                      color: AppColors.white,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    hari,
                    style: TextStyle(
                      fontFamily: fontPoppins,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: AppColors.white,
                    ),
                  ),
                  Text(
                    tanggal,
                    style: TextStyle(
                      fontFamily: fontPoppins,
                      color: AppColors.white,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}