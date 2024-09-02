import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:grapegrow_apps/core/component/build_context_ext.dart';
import 'package:grapegrow_apps/core/constants/colors.dart';
import 'package:grapegrow_apps/core/constants/constant.dart';
import 'package:grapegrow_apps/data/models/responses/modul/modul_budidaya_response.dart';

class CardDetailModul extends StatefulWidget {
  final ModulBudidaya modulBudidaya;

  const CardDetailModul({
    required this.modulBudidaya,
    super.key,
  });

  @override
  State<CardDetailModul> createState() => _CardDetailModulState();
}

class _CardDetailModulState extends State<CardDetailModul> {
  final String fontPoppins = 'FontPoppins';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 8.0,
      ),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.14),
            blurRadius: 16,
            offset: const Offset(2, 4),
            spreadRadius: 2,
          ),
        ],
      ),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CachedNetworkImage(
              imageUrl: '${Variables.baseUrl}/storage/${widget.modulBudidaya.thumbnailCategory}',
              placeholder: (context, url) => SizedBox(
                width: context.deviceWidth,
                height: 200,
                child: const Center(child: CircularProgressIndicator()),
              ),
              errorWidget: (context, url, error) {
                return const Icon(Icons.error);
              },
              width: context.deviceWidth,
              height: 200,
              fit: BoxFit.fitWidth,
            ),
            const SizedBox(height: 8.0),
            Text(
              widget.modulBudidaya.about,
              style: TextStyle(
                fontFamily: fontPoppins,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}