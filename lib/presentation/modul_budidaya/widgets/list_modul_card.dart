import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:grapegrow_apps/core/component/build_context_ext.dart';
import 'package:grapegrow_apps/core/constants/colors.dart';
import 'package:grapegrow_apps/core/constants/constant.dart';
import 'package:grapegrow_apps/data/models/responses/modul/modul_budidaya_response.dart';
import 'package:grapegrow_apps/presentation/modul_budidaya/pages/detail_video_modul.dart';

class ListModulCard extends StatefulWidget {
  final Video data;

  const ListModulCard({
    super.key,
    required this.data,
  });

  @override
  State<ListModulCard> createState() => _ListModulCardState();
}

class _ListModulCardState extends State<ListModulCard> {
  final String fontPoppins = 'FontPoppins';

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(DetailVideoModul(data: widget.data));
      },
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: [
            BoxShadow(
              color: AppColors.black.withOpacity(0.14),
              blurRadius: 16,
              offset: const Offset(0, 4),
              spreadRadius: 2,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(12.0),
                    ),
                    child: CachedNetworkImage(
                      imageUrl: '${Variables.baseUrl}/storage/${widget.data.thumbnailVideo}',
                      placeholder: (context, url) => const SizedBox(
                        width: 80,
                        height: 80,
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      ),
                      errorWidget: (context, url, error) {
                        return const Icon(Icons.error);
                      },
                      width: 80,
                      height: 80,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Icon(
                    Icons.play_circle_outline,
                    size: 40,
                    color: AppColors.white.withOpacity(0.8),
                  )
                ],
              ),
              const SizedBox(width: 12.0),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      widget.data.nama,
                      style: TextStyle(
                        fontFamily: fontPoppins,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        overflow: TextOverflow.ellipsis,
                      ),
                      maxLines: 2,
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