import 'package:flutter/material.dart';
import 'package:grapegrow_apps/core/constants/colors.dart';

class ProfileWidget extends StatelessWidget {
  final String fontPoppins = 'FontPoppins';

  final IconData icon;
  final String title;
  final VoidCallback onPressed;
  final bool endIcon;
  final Color? textColor;

  const ProfileWidget({
    super.key,
    required this.icon,
    required this.title,
    required this.onPressed,
    this.endIcon = true,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPressed,
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: AppColors.primary.withOpacity(0.1),
        ),
        child: Icon(
          icon,
          color: AppColors.primary,
        ),
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 14,
          color: AppColors.grey,
          fontFamily: fontPoppins,
        ),
      ),
      trailing: endIcon
        ? Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: AppColors.grey.withOpacity(0.1),
            ),
            child: const Icon(
              Icons.chevron_right_rounded,
              size: 20.0,
              color: AppColors.black,
            ),
        ) :
      null,
    );
  }
}