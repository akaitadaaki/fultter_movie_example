import 'package:intl/intl.dart';

extension DateTimeExt on DateTime {
  String format(DateFormat format) => format.format(this);

  String formatYMd() => DateFormat('yyyy年MM月dd日').format(this);
  String formatDateTimeYMd() => DateFormat('yyyy-MM-dd').format(this);
  String formatYYYYMMdd() => DateFormat('yyyy/MM/dd').format(this);
  String formatMMdd() => DateFormat('MM/dd').format(this);

  String formatYM() => DateFormat('yyyy年M月').format(this);
  String formatDateTime() => DateFormat('yyyy年MM月dd日 H:mm').format(this);

  String formatTime() => DateFormat('H:mm').format(this);

  String dayOfWeek() => DateFormat.E('ja').format(this);

  bool isToday() => (DateFormat('yyyyMMdd').format(this) == DateFormat('yyyyMMdd').format(DateTime.now()));
}
