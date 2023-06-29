import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:s2w/view_model/video_view_model.dart';
import 'package:s2w/widget/video_card.dart';

class VideoShowScreen extends StatelessWidget {
  final VideoViewModel viewModel;

  VideoShowScreen({required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Short Video Show'),
      ),
      body: Center(
        child: VideoCard(viewModel: viewModel),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: viewModel.previous,
            child: Icon(Icons.skip_previous),
          ),
          SizedBox(height: 16),
          FloatingActionButton(
            onPressed: () {
              if (viewModel.videoController.value.isPlaying) {
                viewModel.pause();
              } else {
                viewModel.play();
              }
            },
            child: Icon(
              viewModel.videoController.value.isPlaying ? Icons.pause : Icons.play_arrow,
            ),
          ),
          SizedBox(height: 16),
          FloatingActionButton(
            onPressed: viewModel.next,
            child: Icon(Icons.skip_next),
          ),
        ],
      ),
    );
  }
}

