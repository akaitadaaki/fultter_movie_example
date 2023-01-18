import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie_data.freezed.dart';

@freezed
abstract class MovieData with _$MovieData {
  factory MovieData({
    required String url,
    required bool autoPlay,
    required bool looping,
  }) = _MovieData;
}
