import 'package:flutter/material.dart';
import 'package:grapegrow_apps/core/constants/colors.dart';
import 'package:grapegrow_apps/presentation/forum/model/comment_model.dart';

class CardComment extends StatefulWidget {
  final CommentModel comment;

  const CardComment({
    super.key,
    required this.comment,
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
                    widget.comment.tukangKomentar,
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
                widget.comment.tanggalBuat,
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
          Center(
            child: Image.asset(
              widget.comment.imagePath,
              width: 200,
              height: 100,
              fit: BoxFit.fill,
            ),
          ),
          const SizedBox(height: 4.0),
          Text(
            widget.comment.komentar,
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