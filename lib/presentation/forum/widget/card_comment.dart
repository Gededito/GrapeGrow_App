import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:grapegrow_apps/core/component/build_context_ext.dart';
import 'package:grapegrow_apps/core/constants/colors.dart';
import 'package:grapegrow_apps/core/constants/constant.dart';
import 'package:grapegrow_apps/data/models/responses/forum/add_comment_forum_response.dart';
import 'package:intl/intl.dart';
import 'package:photo_view/photo_view.dart';

class CardComment extends StatefulWidget {
  final CommentForum data;

  const CardComment({
    super.key,
    required this.data,
  });

  @override
  State<CardComment> createState() => _CardCommentState();
}

class _CardCommentState extends State<CardComment> {
  final String fontPoppins = 'FontPoppins';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 12.0,
        vertical: 12.0,
      ),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.14),
            blurRadius: 12,
            offset: const Offset(2, 4),
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(50.0),
                    ),
                    child: Image.network(
                      'https://i.pravatar.cc/200',
                      width: 40.0,
                      height: 40.0,
                    ),
                  ),
                  const SizedBox(width: 8.0),
                  Text(
                    widget.data.user.name,
                    style: TextStyle(
                      fontFamily: fontPoppins,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      overflow: TextOverflow.ellipsis,
                    ),
                    maxLines: 1,
                  ),
                ],
              ),
              Text(
                DateFormat('dd MMMM yyyy').format(widget.data.createdAt),
                style: TextStyle(
                  fontFamily: fontPoppins,
                  fontSize: 10,
                  overflow: TextOverflow.ellipsis,
                ),
                maxLines: 1,
              ),
            ],
          ),
          const SizedBox(height: 8.0),
          if (widget.data.gambar.isNotEmpty) ...[
            GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => Dialog(
                    child: PhotoView(
                      imageProvider: NetworkImage(
                        '${Variables.baseUrl}/storage/${widget.data.gambar}',
                      ),
                    ),
                  )
                );
              },
              child: Center(
                child: CachedNetworkImage(
                  imageUrl: '${Variables.baseUrl}/storage/${widget.data.gambar}',
                  placeholder: (context, url) => const SizedBox(
                    width: 100,
                    height: 100,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                  errorWidget: (context, url, error) {
                    return const Icon(Icons.error);
                  },
                  width: context.deviceWidth,
                  height: 150,
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            const SizedBox(height: 12.0),
          ],
          const SizedBox(height: 4.0),
          Text(
            widget.data.body,
            style: TextStyle(
              fontFamily: fontPoppins,
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 2.0),
        ],
      ),
    );
  }
}