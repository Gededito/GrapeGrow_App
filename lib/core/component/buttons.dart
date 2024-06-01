import 'package:flutter/material.dart';
import 'package:grapegrow_apps/core/constants/colors.dart';

enum ButtonStyle { filled, outlined }

class Button extends StatelessWidget {
  final Function() onPressed;
  final String label;
  final ButtonStyle style;
  final Color color;
  final Color textColor;
  final double width;
  final double height;
  final double borderRadius;
  final Widget? icon;
  final bool disabled;
  final double fontSize;
  final fontPoppins = 'FontPoppins';

  const Button.filled({
    super.key,
    required this.onPressed,
    required this.label,
    this.style = ButtonStyle.filled,
    this.color = AppColors.primary,
    this.textColor = AppColors.white,
    this.width = double.infinity,
    this.height = 50.0,
    this.borderRadius = 6.0,
    this.icon,
    this.disabled = false,
    this.fontSize = 16.0
  });

  const Button.outlined({
    super.key,
    required this.onPressed,
    required this.label,
    this.style = ButtonStyle.outlined,
    this.color = AppColors.white,
    this.textColor = AppColors.secondary,
    this.width = double.infinity,
    this.height = 50.0,
    this.borderRadius = 6.0,
    this.icon,
    this.disabled = false,
    this.fontSize = 16.0,
  });

  @override 
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: style == ButtonStyle.filled 
        ? ElevatedButton(
          onPressed: disabled ? null : onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: color,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
            )
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              icon ?? const SizedBox.shrink(),
              if (icon != null) const SizedBox(width: 10.0),
              Text(
                label,
                style: TextStyle(
                  color: textColor,
                  fontSize: fontSize,
                  fontWeight: FontWeight.w500,
                  fontFamily: fontPoppins,
                ),
              ),
            ],
          ),
        )
        : OutlinedButton(
          onPressed: disabled ? null : onPressed,
          style: OutlinedButton.styleFrom(
            backgroundColor: color,
            side: const BorderSide(
              color: AppColors.secondary,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              icon ?? const SizedBox.shrink(),
              if (icon != null) const SizedBox(width: 10.0),
              Text(
                label,
                style: TextStyle(
                  color: textColor,
                  fontSize: fontSize,
                  fontWeight: FontWeight.w500,
                  fontFamily: fontPoppins,
                ),
              ),
            ],
          ),
        ),
    );
  }
}