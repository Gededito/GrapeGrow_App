import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grapegrow_apps/core/component/build_context_ext.dart';
import 'package:grapegrow_apps/core/component/buttons.dart';
import 'package:grapegrow_apps/core/component/description_input.dart';
import 'package:grapegrow_apps/core/component/image_input.dart';
import 'package:grapegrow_apps/core/constants/colors.dart';
import 'package:grapegrow_apps/data/models/request/post_request_model.dart';
import 'package:grapegrow_apps/presentation/forum/bloc/post/post_bloc.dart';
import 'package:grapegrow_apps/presentation/forum/pages/forum_page.dart';

class AddForum extends StatefulWidget {
  const AddForum({super.key});

  @override
  State<AddForum> createState() => _AddForumState();
}

class _AddForumState extends State<AddForum> {
  final String fontPoppins = 'FontPoppins';

  final contentController = TextEditingController();
  File? imagePost;

  @override
  void dispose() {
    super.dispose();
    contentController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Diskusi Baru',
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
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              DescriptionInput(
                label: 'Pertanyaan',
                controller: contentController,
              ),
              const SizedBox(
                height: 12,
              ),
              ImageInput(
                label: 'Masukan Gambar (Opsional)',
                onImageSelected: (File? file) {
                  imagePost = file;
                },
              ),
              const SizedBox(height: 40),
              BlocConsumer<PostBloc, PostState>(
                listener: (context, state) {
                  state.maybeWhen(
                    orElse: () {},
                    success: (data) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            "Create Diskusi Success",
                            style: TextStyle(
                              color: AppColors.white,
                            ),
                          ),
                          backgroundColor: AppColors.primary,
                        ),
                      );
                      context.pushReplacement(const ForumPage());
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
                      return Button.filled(
                        onPressed: () {
                          final requestModel = PostRequestModel(
                            content: contentController.text,
                            gambar: imagePost,
                          );

                          context
                            .read<PostBloc>()
                            .add(PostEvent.postForum(requestModel));
                        },
                        label: "Tambahkan",
                      );
                    },
                    loading: () => const Center(
                      child: CircularProgressIndicator(),
                    )
                  );
                }
              ),
              const SizedBox(
                height: 12,
              ),
              Button.outlined(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ForumPage()));
                },
                label: 'Batalkan',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
