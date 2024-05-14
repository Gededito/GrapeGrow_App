import 'package:flutter/material.dart';
import 'package:grapegrow_apps/core/component/button_circle.dart';
import 'package:grapegrow_apps/core/constants/colors.dart';

class SebaranCard extends StatelessWidget {
  final String fontPoppins = 'FontPoppins';

  final Function() onTap;
  final String name;
  final String owner;
  final int jarak;
  final String imagePath;

  const SebaranCard({
    super.key,
    required this.onTap,
    required this.name,
    required this.owner,
    required this.jarak,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: AppColors.black,
              width: 1.0
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                      owner,
                      style: TextStyle(
                        fontFamily: fontPoppins,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        overflow: TextOverflow.ellipsis,
                      ),
                      maxLines: 1,
                    ),
                    const SizedBox(height: 4.0),
                    Text(
                      'Sekitar $jarak m dari lokasimu',
                      style: TextStyle(
                        fontFamily: fontPoppins,
                        fontSize: 12,
                        overflow: TextOverflow.ellipsis,
                      ),
                      maxLines: 1,
                    ),
                  ],
                ),
              ),
              CircleButton(onPressed: onTap),
            ],
          ),
        ),
      ),
    );
  }
}