import 'package:chewie/chewie.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:fultter_base_project/data/model/movie_data.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../theme/app_theme.dart';
import 'chewie_movie_view_model.dart';

class ChewieMoviePage extends HookConsumerWidget {
  const ChewieMoviePage({Key? key, required this.url, required this.autoPlay, required this.looping}) : super(key: key);

  final String url;
  final bool autoPlay;
  final bool looping;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(appThemeProvider);

    // final cewieMovieViewModel =
    //     ref.watch(chewieMovieViewModelProvider(MovieData(url: url, autoPlay: autoPlay, looping: looping)));
    final chewieController = ref.watch(
        chewieMovieViewModelProvider(MovieData(url: url, autoPlay: autoPlay, looping: looping))
            .select((value) => value.chewieController));

    return WillPopScope(
        onWillPop: () {
          // バックキーを押すとここに来る。
          // popしてあげないと、閉じてくれない。
          Navigator.of(context).pop();
          return Future.value(false);
        },
        child: Scaffold(
          appBar: AppBar(
            systemOverlayStyle: SystemUiOverlayStyle(
              // Status bar color
              statusBarColor: theme.appColors.primary,

              // Status bar brightness (optional)
              statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
              statusBarBrightness: Brightness.light, // For iOS (dark icons)
            ),
            title: const Text("動画ページ"),
            centerTitle: true,
          ),
          body: (chewieController == null)
              ? const SizedBox()
              : AspectRatio(
                  aspectRatio: chewieController.videoPlayerController.value.aspectRatio,
                  child: Chewie(
                    controller: chewieController,
                  )),
        )
        // )
        );
  }
}
