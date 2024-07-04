import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grapegrow_apps/core/constants/colors.dart';
import 'package:grapegrow_apps/data/models/responses/get_post_forum_response_model.dart';
import 'package:grapegrow_apps/presentation/forum/bloc/get_comment_forum_id/get_comment_forum_id_bloc.dart';
import 'package:grapegrow_apps/presentation/forum/widget/card_comment.dart';
import 'package:grapegrow_apps/presentation/forum/widget/card_forum.dart';

class CommentPage extends StatefulWidget {
  final Post post;

  const CommentPage({
    super.key,
    required this.post,
  });

  @override
  State<CommentPage> createState() => _CommentPageState();
}

class _CommentPageState extends State<CommentPage> {
  final String fontPoppins = 'FontPoppins';

  final commentController = TextEditingController();

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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CardForum(data: widget.post),
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
              BlocBuilder<GetCommentForumIdBloc, GetCommentForumIdState>(
                builder: (context, state) {
                  return state.maybeWhen(
                    orElse: () => const Center(child: Text("Tidak Ada Komentar")),
                    loading: () => const Center(
                      child: CircularProgressIndicator(),
                    ),
                    success: (datas) {
                      return SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListView.separated(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: datas.comments.length,
                            separatorBuilder: (context, index) => const SizedBox(height: 8.0),
                            itemBuilder: (context, index) {
                              return CardComment(
                                data: datas.comments[index],
                              );
                            },
                          ),
                        ),
                      );
                    }
                  );
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Material(
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
                margin: const EdgeInsets.symmetric(vertical: 6),
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
            ),
          ],
        ),
      ),
    );
  }
}
