import 'package:flutter/material.dart';
import 'package:grapegrow_apps/core/constants/colors.dart';

class CircleButton extends StatelessWidget {
  final VoidCallback onPressed;

  const CircleButton({
    super.key,
    required this.onPressed,
  });

  @override 
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        shape: const CircleBorder(),
      ),
      child: const Icon(
        Icons.alt_route,
        color: AppColors.white,
        size: 20,
      ),
    );
  }
}