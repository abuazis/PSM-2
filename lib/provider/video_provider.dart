import 'package:flutter/material.dart';
import 'package:psm/models/video.dart';

class VideoProvider extends ChangeNotifier {
  int _currentPlay = 0;
  String _title = videoList[0].title;

  int get currentPlay => _currentPlay;
  String get title => _title;

  void initPlay({int currentPlay, String title}) {
    _currentPlay = currentPlay;
    _title = title;

    notifyListeners();
  }

  void changeToNextVideo() {
    _currentPlay++;
    _title = videoList[currentPlay].title;

    notifyListeners();
  }

  void changeToPreviousVideo() {
    _currentPlay--;
    _title = videoList[currentPlay].title;

    notifyListeners();
  }
}
