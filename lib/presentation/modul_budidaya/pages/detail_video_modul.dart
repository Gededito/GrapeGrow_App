import 'package:flutter/material.dart';
import 'package:grapegrow_apps/core/constants/colors.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:grapegrow_apps/data/models/responses/modul/modul_budidaya_response.dart';

class DetailVideoModul extends StatefulWidget {
  final Video data;

  const DetailVideoModul({
    super.key,
    required this.data,
  });

  @override
  State<DetailVideoModul> createState() => _DetailVideoModulState();
}

class _DetailVideoModulState extends State<DetailVideoModul> {
  late YoutubePlayerController _controller;
  final String fontPoppins = 'FontPoppins';

  @override
  void initState() {
    super.initState();

    _controller = YoutubePlayerController(
      initialVideoId: widget.data.pathVideo,
      flags: const YoutubePlayerFlags(
        mute: false,
        autoPlay: false,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.data.nama,
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            YoutubePlayer(
              controller: _controller,
              showVideoProgressIndicator: true,
              bottomActions: const [
                CurrentPosition(),
                ProgressBar(
                  isExpanded: true,
                  colors: ProgressBarColors(
                    playedColor: Colors.amber,
                    handleColor: Colors.amberAccent,
                  ),
                ),
                PlaybackSpeedButton(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}