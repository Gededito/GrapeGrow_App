import 'package:flutter/material.dart';
import 'package:grapegrow_apps/core/constants/colors.dart';

class ListItemCard extends StatelessWidget {
  final String fontPoppins = 'FontPoppins';

  final Function() onTap;
  final String name;
  final String desc;
  final String imagePath;

  const ListItemCard({
    super.key,
    required this.onTap,
    required this.name,
    required this.desc,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        decoration: ShapeDecoration(
          color: AppColors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          shadows: [
            BoxShadow(
              color: AppColors.black.withOpacity(0.14),
              blurRadius: 17,
              offset: const Offset(0, 8),
              spreadRadius: 2,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                child: Image.asset(
                  imagePath,
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 12.0),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      name,
                      style: TextStyle(
                        fontFamily: fontPoppins,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        overflow: TextOverflow.ellipsis,
                      ),
                      maxLines: 1,
                    ),
                    const SizedBox(height: 4.0),
                    Text(
                      desc,
                      style: TextStyle(
                        fontFamily: fontPoppins,
                        fontSize: 12,
                        overflow: TextOverflow.ellipsis,
                      ),
                      maxLines: 3,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}