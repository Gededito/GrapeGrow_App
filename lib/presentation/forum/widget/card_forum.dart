import 'package:flutter/material.dart';
import 'package:grapegrow_apps/core/constants/colors.dart';
import 'package:grapegrow_apps/presentation/forum/model/forum_model.dart';
import 'package:grapegrow_apps/presentation/forum/pages/comment_page.dart';

class CardForum extends StatefulWidget {
  final ForumModel data;

  const CardForum({
    super.key,
    required this.data,
  });

  @override
  State<CardForum> createState() => _CardForumState();
}

class _CardForumState extends State<CardForum> {
  final String fontPoppins = 'FontPoppins';

  final bool likedForum = true;

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
                    widget.data.namaPengguna!,
                    style: TextStyle(
                      fontFamily: fontPoppins,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      overflow: TextOverflow.ellipsis,
                    ),
                    maxLines: 1,
                  ),
                  Text(
                    widget.data.tanggalBuat!,
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
          const SizedBox(height: 8.0),
          Center(
            child: Image.asset(
              widget.data.imagePath!,
              width: 200,
              height: 150,
              fit: BoxFit.fill,
            ),
          ),
          const SizedBox(height: 8.0),
          Text(
            widget.data.contentText!,
            style: TextStyle(
              fontFamily: fontPoppins,
              fontSize: 12,
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CommentPage(forumModel: widget.data)
                    )
                  );
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