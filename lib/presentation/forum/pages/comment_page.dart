import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grapegrow_apps/core/component/build_context_ext.dart';
import 'package:grapegrow_apps/core/constants/colors.dart';
import 'package:grapegrow_apps/data/models/request/comment_request_model.dart';
import 'package:grapegrow_apps/data/models/responses/forum/add_post_forum_response_model.dart';
import 'package:grapegrow_apps/presentation/forum/bloc/add_comment/add_comment_bloc.dart';
import 'package:grapegrow_apps/presentation/forum/bloc/get_comment_forum_id/get_comment_forum_id_bloc.dart';
import 'package:grapegrow_apps/presentation/forum/widget/card_comment.dart';
import 'package:grapegrow_apps/presentation/forum/widget/card_forum.dart';
import 'package:image_picker/image_picker.dart';

class CommentPage extends StatefulWidget {
  final PostForum data;

  const CommentPage({
    super.key,
    required this.data,
  });

  @override
  State<CommentPage> createState() => _CommentPageState();
}

class _CommentPageState extends State<CommentPage> {
  final String fontPoppins = 'FontPoppins';

  File? _imageFile;
  final commentController = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<GetCommentForumIdBloc>().add(
        GetCommentForumIdEvent.getAllCommentById(widget.data.id));
  }

  Future _getImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _imageFile = File(image.path);
        // print(_imageFile);
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
    commentController.dispose();
  }

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
      body: RefreshIndicator(
        onRefresh: () async {
          context.read<GetCommentForumIdBloc>().add(GetCommentForumIdEvent.getAllCommentById(widget.data.id));
          await Future.delayed(const Duration(milliseconds: 1000));
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CardForum(data: widget.data),
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
                      loading: () => const Center(child: CircularProgressIndicator()),
                      success: (datas) {

                        // Filter Comments by PostForum ID
                        final commentsForPost = datas.comments
                            .where((comment) => comment.postId == widget.data.id)
                            .toList();

                          return SingleChildScrollView(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ListView.separated(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: commentsForPost.length,
                                separatorBuilder: (context, index) =>
                                    const SizedBox(height: 8.0),
                                itemBuilder: (context, index) {
                                  return CardComment(
                                    data: commentsForPost[index],
                                  );
                                },
                              ),
                            ),
                          );
                      });
                    },
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Material(
        elevation: 8,
        color: AppColors.primary,
        child: Row(
          children: [
            IconButton(
              onPressed: () {
                _getImage();
              },
              icon: const Icon(
                Icons.image,
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
            BlocConsumer<AddCommentBloc, AddCommentState>(
              listener: (context, state) {
                state.maybeWhen(
                  orElse: () {},
                  success: (data) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          "Create Comment Success",
                          style: TextStyle(
                            color: AppColors.white,
                          ),
                        ),
                        backgroundColor: AppColors.primary,
                      ),
                    );
                    context.pushReplacement(CommentPage(data: widget.data));
                  },
                  error: (message) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(message),
                        backgroundColor: Colors.redAccent,
                      )
                    );
                  }
                );
              },
              builder: (context, state) {
                return state.maybeWhen(
                  orElse: () {
                    return IconButton(
                      onPressed: () {
                        final requestModel = CommentRequestModel(
                          body: commentController.text,
                          gambar: _imageFile
                        );

                        context
                          .read<AddCommentBloc>()
                          .add(AddCommentEvent.addComment(requestModel, widget.data.id));
                      },
                      icon: const Icon(
                        Icons.send,
                        color: AppColors.white,
                      ),
                    );
                  },
                  loading: () => const CircularProgressIndicator(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
