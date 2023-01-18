import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

import '../../foundation/constants.dart';

final mainViewModelProvider = ChangeNotifierProvider((ref) => MainViewModel());

class MainViewModel extends ChangeNotifier {
  MainViewModel() {
    init();
  }

  String inputName = "";
  late final String _videoPath;
  List<String> get fileList => _fileList;
  List<String> _fileList = [];

  int? get selectedIndex => _selectedIndex;
  int? _selectedIndex;

  String get progressString => _progressString;
  String _progressString = "";

  void init() async {
    final dir = await getApplicationDocumentsDirectory();
    _videoPath = "${dir.path}$videoSegments";
    final directory = Directory(_videoPath);
    await directory.create(recursive: true);

    getFileList();
  }

  Future<void> downloadFile(String url) async {
    Dio dio = Dio();
    try {
      final uri = Uri.parse(url);
      final moviePath = "$_videoPath${basename(uri.path)}";
      await dio.download(url, moviePath, onReceiveProgress: (rec, total) {
        _progressString = "$rec/$total (" + ((rec / total) * 100).floor().toStringAsFixed(0) + "%)";
        debugPrint("progressString: $progressString");
        notifyListeners();
      });
    } catch (e) {
      debugPrint(e.toString());
      _progressString = e.toString();
    }

    _progressString = "";

    debugPrint("Download completed");
    getFileList();
  }

  void getFileList() {
    final List<FileSystemEntity> directoryPath = Directory(_videoPath).listSync();
    _fileList = directoryPath.map((e) => e.path).toList();
    notifyListeners();
  }

  void selectIndex(int index) {
    (_selectedIndex == index) ? _selectedIndex = null : _selectedIndex = index;
    notifyListeners();
  }
}
