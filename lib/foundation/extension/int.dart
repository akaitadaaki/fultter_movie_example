import 'package:intl/intl.dart';

extension IntExt on int {
  String format(NumberFormat format) {
    return format.format(this);
  }

  String formatStep() {
    return NumberFormat('#,###').format(this);
  }
}
