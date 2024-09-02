import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:grapegrow_apps/core/component/build_context_ext.dart';
import 'package:grapegrow_apps/core/constants/colors.dart';
import 'package:grapegrow_apps/core/constants/constant.dart';
import 'package:grapegrow_apps/data/models/responses/modul/modul_budidaya_response.dart';
import 'package:grapegrow_apps/presentation/modul_budidaya/pages/list_modul_page.dart';

class ModulCard extends StatefulWidget {
  final ModulBudidaya data;

  const ModulCard({
    super.key,
    required this.data,
  });

  @override
  State<ModulCard> createState() => _ModulCardState();
}

class _ModulCardState extends State<ModulCard> {
  final String fontPoppins = 'FontPoppins';

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(
          ListModulPage(data: widget.data),
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
                  imageUrl: '${Variables.baseUrl}/storage/${widget.data.thumbnailCategory}',
                  placeholder: (context, url) => const SizedBox(
                    width: 100,
                    height: 100,
                    child: Center(child: CircularProgressIndicator()),
                  ),
                  errorWidget: (context, url, error) {
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
                      widget.data.name,
                      style: TextStyle(
                        fontFamily: fontPoppins,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        overflow: TextOverflow.ellipsis,
                      ),
                      maxLines: 2,
                    ),
                    const SizedBox(height: 12.0),
                    Text(
                      widget.data.about,
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