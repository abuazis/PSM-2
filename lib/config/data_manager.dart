import 'dart:async';

import 'package:flick_video_player/flick_video_player.dart';
import 'package:video_player/video_player.dart';

class DataManager {
  int currentPlaying = 0;
  final FlickManager flickManager;
  final List<String> urls;

  DataManager({
    this.currentPlaying,
    this.flickManager,
    this.urls,
  });

  Timer videoChangeTimer;

  String getNextVideo() {
    currentPlaying++;
    return urls[currentPlaying];
  }

  bool hasNextVideo() {
    return currentPlaying != urls.length - 1;
  }

  bool hasPreviousVideo() {
    return currentPlaying != 0;
  }

  skipToNextVideo([Duration duration]) {
    if (hasNextVideo()) {
      flickManager.handleChangeVideo(
        VideoPlayerController.asset(urls[currentPlaying + 1]),
        videoChangeDuration: duration,
      );

      currentPlaying++;
    }
  }

  skipToPreviousVideo() {
    if (hasPreviousVideo()) {
      currentPlaying--;
      flickManager.handleChangeVideo(
        VideoPlayerController.asset(urls[currentPlaying]),
      );
    }
  }

  cancelVideoAutoPlayTimer({bool playNext}) {
    if (playNext != true) {
      currentPlaying--;
    }

    flickManager.flickVideoManager
        ?.cancelVideoAutoPlayTimer(playNext: playNext);
  }
}
