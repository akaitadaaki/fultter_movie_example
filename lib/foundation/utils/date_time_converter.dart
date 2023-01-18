import 'package:json_annotation/json_annotation.dart';

class DateTimeConverter implements JsonConverter<DateTime, String> {
  const DateTimeConverter();

  @override
  DateTime fromJson(String json) {
    final value = int.tryParse(json);
    if (value == null) {
      return DateTime.parse(json);
    } else {
      return DateTime.fromMillisecondsSinceEpoch(value * 1000);
    }
  }

  @override
  String toJson(DateTime dateTime) {
    // 日付はサーバ側からはISO8601形式の文字列で来てエンティティはDateTimeとしているが、
    // DBへの登録はintにすることで検索時に間違いが起こらないようにする
    // その結果、DB→エンティティの変換で決め打ちでlast_updateのみ変換をしている
    return (dateTime.millisecondsSinceEpoch / 1000).floor().toString();
  }
}
