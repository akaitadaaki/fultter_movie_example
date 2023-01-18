import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:video_player/video_player.dart';

final movieViewModelProvider =
    ChangeNotifierProvider.autoDispose.family<MovieViewModel, String>((ref, url) => MovieViewModel(url));

class MovieViewModel extends ChangeNotifier {
  MovieViewModel(this._url) {
    init();
  }

  void init() async {
    // final dir = await getApplicationDocumentsDirectory();
    // final path = "${dir.path}/video/";
    // var moviePath = "${path}demo3.mp4";
    // _videoPlayerController = VideoPlayerController.file(File(moviePath))
    _videoPlayerController = VideoPlayerController.file(File(_url))
      ..initialize().then((_) {
        _videoPlayerController?.play();
      }).whenComplete(notifyListeners);
  }

  final String _url;

  VideoPlayerController? get videoPlayerController => _videoPlayerController;
  VideoPlayerController? _videoPlayerController;

  @override
  @mustCallSuper
  void dispose() {
    super.dispose();
    _videoPlayerController?.dispose();
  }
}
