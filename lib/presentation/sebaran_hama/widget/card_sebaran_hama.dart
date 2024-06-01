import 'package:flutter/material.dart';
import 'package:grapegrow_apps/core/constants/colors.dart';
import 'package:grapegrow_apps/presentation/sebaran_hama/model/sebaran_hama_model.dart';

class CardSebaranHama extends StatefulWidget {
  final SebaranHamaModel data;
  final Function() onTap;

  const CardSebaranHama({
    super.key,
    required this.onTap,
    required this.data,
  });

  @override
  State<CardSebaranHama> createState() => _CardSebaranHamaState();
}

class _CardSebaranHamaState extends State<CardSebaranHama> {
  final String fontPoppins = 'FontPoppins';

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        padding: const EdgeInsets.all(4.0),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: [
            BoxShadow(
              color: AppColors.black.withOpacity(0.14),
              blurRadius: 16,
              offset: const Offset(0, 8),
              spreadRadius: 2,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.all(
                  Radius.circular(12.0),
                ),
                child: Image.asset(
                  widget.data.imageHama,
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 12.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.data.namaOpt,
                      style: TextStyle(
                        fontFamily: fontPoppins,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        overflow: TextOverflow.ellipsis
                      ),
                      maxLines: 1,
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      widget.data.namaPemilik,
                      style: TextStyle(
                        fontFamily: fontPoppins,
                        fontWeight: FontWeight.w500,
                        overflow: TextOverflow.ellipsis,
                      ),
                      maxLines: 1,
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      widget.data.alamat,
                      style: TextStyle(
                        fontFamily: fontPoppins,
                        overflow: TextOverflow.ellipsis,
                      ),
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