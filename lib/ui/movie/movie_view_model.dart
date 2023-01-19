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
    _videoPlayerController = VideoPlayerController.file(File(_url))
      ..initialize().then((_) {
        _videoPlayerController.setLooping(true);
        _videoPlayerController.play();
      }).whenComplete(notifyListeners);
  }

  final String _url;

  VideoPlayerController get videoPlayerController => _videoPlayerController;
  late VideoPlayerController _videoPlayerController;

  @override
  @mustCallSuper
  void dispose() {
    super.dispose();
    _videoPlayerController.dispose();
  }
}
