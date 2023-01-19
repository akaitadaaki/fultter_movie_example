import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:video_player/video_player.dart';

import '../theme/app_theme.dart';
import 'movie_view_model.dart';

class MoviePage extends HookConsumerWidget {
  const MoviePage({
    Key? key,
    required this.url,
  }) : super(key: key);

  final String url;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(appThemeProvider);

    final player = ref.watch(movieViewModelProvider(url).select((value) => value.videoPlayerController));
    final isInitialized =
        ref.watch(movieViewModelProvider(url).select((value) => value.videoPlayerController.value.isInitialized));

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
          body: (isInitialized != true)
              ? const SizedBox()
              : Column(
                  children: [
                    AspectRatio(
                      aspectRatio: player.value.aspectRatio,
                      child: Stack(children: [
                        VideoPlayer(player),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: VideoProgressIndicator(
                            player,
                            allowScrubbing: false,
                          ),
                        )
                      ]),
                    )
                  ],
                )),
      // )
    );
  }
}
