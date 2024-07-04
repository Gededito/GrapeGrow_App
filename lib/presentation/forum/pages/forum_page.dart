import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grapegrow_apps/core/constants/colors.dart';
import 'package:grapegrow_apps/presentation/forum/bloc/list_post/list_post_bloc.dart';
import 'package:grapegrow_apps/presentation/forum/pages/add_forum.dart';
import 'package:grapegrow_apps/presentation/forum/widget/card_forum.dart';

class ForumPage extends StatefulWidget {
  const ForumPage({super.key});

  @override
  State<ForumPage> createState() => _ForumPageState();
}

class _ForumPageState extends State<ForumPage> {
  final String fontPoppins = 'FontPoppins';

  @override
  void initState() {
    super.initState();
    context.read<ListPostBloc>().add(const ListPostEvent.getAllPost());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Forum Diskusi',
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
      body: BlocBuilder<ListPostBloc, ListPostState>(
        builder: (context, state) {
          return state.maybeWhen(
            orElse: () => const Center(child: Text("Terjadi Error")),
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
                    itemCount: datas.posts.length,
                    separatorBuilder: (context, index) => const SizedBox(height: 8.0),
                    itemBuilder: (context, index) {
                      return CardForum(
                        data: datas.posts[index],
                      );
                    },
                  ),
                ),
              );
            }
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddForum()
            )
          );
        },
        backgroundColor: AppColors.white,
        child: const Icon(
          Icons.message_rounded,
          size: 30,
          color: AppColors.primary,
        ),
      ),
    );
  }
}