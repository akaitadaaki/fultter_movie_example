import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';

import '../theme/app_theme.dart';
import 'main_view_model.dart';

// サンプル動画
// https://www.home-movie.biz/mov/hts-samp001.mp4
// https://www9.nhk.or.jp/das/movie/D0002080/D0002080183_00000_V_000.mp4

class MainPage extends HookConsumerWidget {
  MainPage({Key? key}) : super(key: key);

  final TextEditingController _fileController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(appThemeProvider);

    final mainViewModel = ref.watch(mainViewModelProvider);
    final movieFileList = ref.watch(mainViewModelProvider.select((value) => value.fileList));
    final progressString = ref.watch(mainViewModelProvider.select((value) => value.progressString));
    FlutterNativeSplash.remove();

    return Scaffold(
        appBar: AppBar(
          systemOverlayStyle: SystemUiOverlayStyle(
            // Status bar color
            statusBarColor: theme.appColors.primary,

            // Status bar brightness (optional)
            statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
            statusBarBrightness: Brightness.light, // For iOS (dark icons)
          ),
          title: const Text("メインページ"),
          centerTitle: true,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
                height: 60.h,
                child: Row(children: [
                  SizedBox(
                    width: 50.w,
                    child: Text("動画URL", style: theme.textTheme.s10.bold().sp()),
                  ),
                  Expanded(
                      child: TextField(
                    controller: _fileController,
                    onChanged: (value) {
                      mainViewModel.inputName = value;
                    },
                  )),
                  SizedBox(
                      width: 82.w,
                      child: ElevatedButton(
                        child: Text("Download", style: theme.textTheme.s10.sp()),
                        onPressed: () {
                          if (_fileController.text.isNotEmpty) {
                            mainViewModel.downloadFile(_fileController.text);
                            _fileController.text = "";
                          }
                        },
                      ))
                ])),
            Divider(
              color: theme.appColors.border,
              thickness: 1,
              height: 0,
            ),
            Expanded(
                child: ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: movieFileList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(basename(movieFileList[index])),
                  onTap: () => mainViewModel.selectIndex(index),
                  tileColor: (mainViewModel.selectedIndex == index) ? Colors.blue.shade200 : null,
                );
              },
            )),
            Row(
              children: [
                Expanded(
                    child: ElevatedButton(
                  child: Text("標準のみ", style: theme.textTheme.s10.sp()),
                  onPressed: () => (mainViewModel.selectedIndex == null)
                      //? null : print(movieFileList[mainViewModel.selectedIndex!]),
                      ? null
                      : context.pushNamed(
                          "movie",
                          params: {'url': movieFileList[mainViewModel.selectedIndex!]},
                        ),
                )),
                Expanded(
                    child: ElevatedButton(
                  child: Text("chewie追加利用", style: theme.textTheme.s10.sp()),
                  onPressed: () => (mainViewModel.selectedIndex == null)
                      ? null
                      : context.pushNamed(
                          "chewie",
                          params: {
                            "url": movieFileList[mainViewModel.selectedIndex!],
                            "autoPlay": "true",
                            "looping": "true",
                          },
                        ),
                )),
              ],
            ),
            (progressString.isNotEmpty)
                ? Container(
                    width: double.infinity, padding: EdgeInsets.all(4.r), child: Text("downloading:$progressString"))
                : const SizedBox()
          ],
        ));
  }
}
