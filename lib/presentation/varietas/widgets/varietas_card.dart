import 'package:flutter/material.dart';
import 'package:grapegrow_apps/core/component/build_context_ext.dart';
import 'package:grapegrow_apps/core/constants/colors.dart';
import 'package:grapegrow_apps/data/models/responses/varietas_response_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:grapegrow_apps/presentation/varietas/pages/detail_varietas_page.dart';
import 'package:grapegrow_apps/core/constants/constant.dart';

class VarietasCard extends StatelessWidget {
  final String fontPoppins = 'FontPoppins';
  final Varietas data;

  const VarietasCard({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(
          DetailVarietasPage(data: data),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 8.0,
        ),
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
          padding: const EdgeInsets.all(12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.all(
                  Radius.circular(12.0),
                ),
                child: CachedNetworkImage(
                  imageUrl: '${Variables.baseUrl}/storage/${data.gambarVarietas}',
                  placeholder: (context, url) => const SizedBox(
                      width: 100,
                      height: 100,
                      child: Center(child: CircularProgressIndicator())
                  ),
                  errorWidget: (context, url, error) {
                    // print('$error');
                    return const Icon(Icons.error);
                  },
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
                      data.nama,
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
                      data.deskripsi,
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