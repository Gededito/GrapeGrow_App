import 'package:flutter/material.dart';
import 'package:grapegrow_apps/core/constants/colors.dart';
import 'package:grapegrow_apps/presentation/forum/model/forum_model.dart';
import 'package:grapegrow_apps/presentation/forum/pages/add_forum.dart';
import 'package:grapegrow_apps/presentation/forum/widget/card_forum.dart';

class ForumPage extends StatefulWidget {
  const ForumPage({super.key});

  @override 
  State<ForumPage> createState() => _ForumPageState();
}

class _ForumPageState extends State<ForumPage> {
  final String fontPoppins = 'FontPoppins';

  final List<ForumModel> forum = [
    ForumModel(
      namaPengguna: 'Gede Dito',
      tanggalBuat: 'tanggal pembuatan',
      imagePath: 'assets/images/testing_1.jpg',
      contentText: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaeca',
    ),
    ForumModel(
      namaPengguna: 'Akmal Fauzan',
      tanggalBuat: 'tanggal pembuatan',
      imagePath: 'assets/images/testing_2.jpg',
      contentText: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaeca',
    ),
    ForumModel(
      namaPengguna: 'Gede Dito',
      tanggalBuat: 'tanggal pembuatan',
      imagePath: 'assets/images/testing_1.jpg',
      contentText: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaeca',
    ),
    ForumModel(
      namaPengguna: 'Akmal Fauzan',
      tanggalBuat: 'tanggal pembuatan',
      imagePath: 'assets/images/testing_2.jpg',
      contentText: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaeca',
    ),
    ForumModel(
      namaPengguna: 'Gede Dito',
      tanggalBuat: 'tanggal pembuatan',
      imagePath: 'assets/images/testing_1.jpg',
      contentText: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaeca',
    ),
    ForumModel(
      namaPengguna: 'Akmal Fauzan',
      tanggalBuat: 'tanggal pembuatan',
      imagePath: 'assets/images/testing_2.jpg',
      contentText: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaeca',
    ),
  ];

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
      body: ListView.builder(
        itemCount: forum.length,
        itemBuilder: (context, int index) {
          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 8.0,
              vertical: 8.0
            ),
            child: CardForum(data: forum[index]),
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