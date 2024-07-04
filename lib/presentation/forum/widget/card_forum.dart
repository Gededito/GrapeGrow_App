import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:grapegrow_apps/core/component/build_context_ext.dart';
import 'package:grapegrow_apps/core/constants/colors.dart';
import 'package:grapegrow_apps/core/constants/constant.dart';
import 'package:grapegrow_apps/data/models/responses/get_post_forum_response_model.dart';
import 'package:grapegrow_apps/presentation/forum/pages/comment_page.dart';
import 'package:intl/intl.dart';

class CardForum extends StatefulWidget {
  final Post data;

  const CardForum({
    super.key,
    required this.data,
  });

  @override
  State<CardForum> createState() => _CardForumState();
}

class _CardForumState extends State<CardForum> {
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.data.user.name,
                    style: TextStyle(
                      fontFamily: fontPoppins,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      overflow: TextOverflow.ellipsis,
                    ),
                    maxLines: 1,
                  ),
                  Text(
                    DateFormat('dd MMMM yyyy').format(widget.data.createdAt),
                    style: TextStyle(
                      fontFamily: fontPoppins,
                      fontSize: 12,
                      overflow: TextOverflow.ellipsis,
                    ),
                    maxLines: 1,
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 12.0),
          if (widget.data.gambar!.isNotEmpty) ...[
            Center(
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
                fit: BoxFit.fill,
              ),
            ),
            const SizedBox(height: 12.0),
          ],
          Text(
            widget.data.content,
            style: TextStyle(
              fontFamily: fontPoppins,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 8.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.thumb_up,
                  color: AppColors.grey,
                ),
              ),
              const SizedBox(width: 8.0),
              IconButton(
                onPressed: () {
                  context.push(CommentPage(post: widget.data));
                },
                icon: const Icon(
                  Icons.message,
                  color: AppColors.grey,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}