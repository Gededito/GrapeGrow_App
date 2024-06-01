import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grapegrow_apps/core/constants/colors.dart';
import 'package:grapegrow_apps/presentation/forum/model/comment_model.dart';
import 'package:grapegrow_apps/presentation/forum/model/forum_model.dart';
import 'package:grapegrow_apps/presentation/forum/widget/card_comment.dart';
import 'package:grapegrow_apps/presentation/forum/widget/card_forum.dart';

class CommentPage extends StatefulWidget {
  const CommentPage({
    super.key,
    required this.forumModel,
  });

  final ForumModel forumModel;

  @override
  State<CommentPage> createState() => _CommentPageState();
}

class _CommentPageState extends State<CommentPage> {
  final String fontPoppins = 'FontPoppins';

  final commentController = TextEditingController();

  final List<CommentModel> data = [
    CommentModel(
      tukangKomentar: 'Tina Kun',
      komentar: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
      imagePath: 'assets/images/testing_1.jpg',
      tanggalBuat: 'tanggal pembuatan',
    ),
    CommentModel(
      tukangKomentar: 'Jaenuri',
      komentar: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
      imagePath: 'assets/images/testing_2.jpg',
      tanggalBuat: 'tanggal pembuatan',
    ),
    CommentModel(
      tukangKomentar: 'Made Agung',
      komentar: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
      imagePath: 'assets/images/testing_2.jpg',
      tanggalBuat: 'tanggal pembuatan'
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Komentar',
          style: TextStyle(
            fontSize: 16,
            fontFamily: fontPoppins,
            fontWeight: FontWeight.w500,
            color: AppColors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: AppColors.primary,
        iconTheme: const IconThemeData(
          color: AppColors.white,
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CardForum(data: widget.forumModel),
                  const SizedBox(height: 12),
                  Text(
                    'Komentar',
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: fontPoppins,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  ListView.builder(
                    itemCount: data.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, int index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 4.0,
                          vertical: 4.0,
                        ),
                        child: CardComment(comment: data[index]),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0, // Position at the bottom
            left: 0,
            right: 0,
            child: Material(
              elevation: 8,
              color: AppColors.primary,
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.image,
                      color: AppColors.white,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.photo_camera,
                      color: AppColors.white,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 4),
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextField(
                        controller: commentController,
                        minLines: 1,
                        maxLines: 5,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          isDense: true,
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 12,
                          ),
                        ),
                        style: const TextStyle(
                          height: 1,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.check,
                      color: AppColors.white,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}