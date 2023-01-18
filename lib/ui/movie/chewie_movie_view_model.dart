import 'dart:io';

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:video_player/video_player.dart';

import '../../data/model/movie_data.dart';

final chewieMovieViewModelProvider = ChangeNotifierProvider.autoDispose
    .family<ChewieMovieViewModel, MovieData>((ref, movieData) => ChewieMovieViewModel(movieData));

class ChewieMovieViewModel extends ChangeNotifier {
  final MovieData _movieData;

  VideoPlayerController? _videoPlayerController;

  ChewieController? get chewieController => _chewieController;
  ChewieController? _chewieController;

  ChewieMovieViewModel(this._movieData) {
    init();
  }

  void init() async {
    _videoPlayerController = VideoPlayerController.file(File(_movieData.url))
      ..initialize().then((_) {
        _chewieController = ChewieController(
          videoPlayerController: _videoPlayerController!,
          autoPlay: _movieData.autoPlay,
          looping: _movieData.looping,
          allowFullScreen: false,
        );
      }).whenComplete(notifyListeners);
  }

  @override
  @mustCallSuper
  void dispose() {
    _videoPlayerController?.dispose();
    _chewieController?.dispose();
    super.dispose();
  }
}
