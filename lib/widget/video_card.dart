import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../view_model/video_view_model.dart';

class VideoCard extends StatelessWidget {
  final VideoViewModel viewModel;

  VideoCard({required this.viewModel});

  @override
  Widget build(BuildContext context) {
    final controller = viewModel.videoController;

    return FutureBuilder(
      future: viewModel.initializeVideoPlayer(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return AspectRatio(
            aspectRatio: controller.value.aspectRatio,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                VideoPlayer(controller),
                VideoProgressIndicator(controller, allowScrubbing: true),
              ],
            ),
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}

