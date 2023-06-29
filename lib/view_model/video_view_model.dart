import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../models/video_model.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoViewModel with ChangeNotifier {
  final List<VideoModel> videos;
  int currentIndex = 0;
  late VideoPlayerController _videoController;
  late Future<void> _initializeVideoPlayerFuture;

  VideoViewModel(this.videos) {
    _videoController = VideoPlayerController.network(videos[currentIndex].videoUrl);
    _initializeVideoPlayerFuture = _videoController.initialize();
  }

  VideoPlayerController get videoController => _videoController;

  Future<void> initializeVideoPlayer() async {
    await _initializeVideoPlayerFuture;
    notifyListeners();
  }

  void disposeVideoPlayer() {
    _videoController.dispose();
  }

  void play() {
    _videoController.play();
  }

  void pause() {
    _videoController.pause();
  }

  void next() {
    if (currentIndex < videos.length - 1) {
      currentIndex++;
      disposeVideoPlayer();
      _videoController = VideoPlayerController.network(videos[currentIndex].videoUrl);
      _initializeVideoPlayerFuture = _videoController.initialize();
      initializeVideoPlayer();
    }
  }

  void previous() {
    if (currentIndex > 0) {
      currentIndex--;
      disposeVideoPlayer();
      _videoController = VideoPlayerController.network(videos[currentIndex].videoUrl);
      _initializeVideoPlayerFuture = _videoController.initialize();
      initializeVideoPlayer();
    }
  }
}

