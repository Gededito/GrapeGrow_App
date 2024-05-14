import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CategoryCard extends StatelessWidget {
  final String fontPoppins = 'FontPoppins';

  final String imagePath;
  final String name;
  final VoidCallback onPressed;

  const CategoryCard({
    super.key,
    required this.imagePath,
    required this.name,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SvgPicture.asset(
              imagePath,
              width: 40.0,
              height: 40.0,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 8.0,),
            Text(
              name,
              style: TextStyle(
                fontFamily: fontPoppins,
                fontSize: 10,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}