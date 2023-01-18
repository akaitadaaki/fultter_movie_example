import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'font_size.dart';

class AppTextTheme {
  const AppTextTheme._({
    required this.s10,
    required this.s12,
    required this.s14,
    required this.s16,
    required this.s18,
    required this.s20,
    required this.s24,
    required this.s28,
    required this.s32,
    required this.s36,
    required this.s40,
  });

  factory AppTextTheme(AppColors appColors) {
    var _normalRegular = TextStyle(
        fontWeight: FontWeight.w400,
        height: 1.5,
        leadingDistribution: TextLeadingDistribution.even,
        color: appColors.textColorBase);
    return AppTextTheme._(
      s10: _normalRegular.merge(const TextStyle(fontSize: FontSize.pt10)),
      s12: _normalRegular.merge(const TextStyle(fontSize: FontSize.pt12)),
      s14: _normalRegular.merge(const TextStyle(fontSize: FontSize.pt14)),
      s16: _normalRegular.merge(const TextStyle(fontSize: FontSize.pt16)),
      s18: _normalRegular.merge(const TextStyle(fontSize: FontSize.pt18)),
      s20: _normalRegular.merge(const TextStyle(fontSize: FontSize.pt20)),
      s24: _normalRegular.merge(const TextStyle(fontSize: FontSize.pt24)),
      s28: _normalRegular.merge(const TextStyle(fontSize: FontSize.pt28)),
      s32: _normalRegular.merge(const TextStyle(fontSize: FontSize.pt32)),
      s36: _normalRegular.merge(const TextStyle(fontSize: FontSize.pt32)),
      s40: _normalRegular.merge(const TextStyle(fontSize: FontSize.pt40)),
    );
  }

  final TextStyle s10;
  final TextStyle s12;
  final TextStyle s14;
  final TextStyle s16;
  final TextStyle s18;
  final TextStyle s20;
  final TextStyle s24;
  final TextStyle s28;
  final TextStyle s32;
  final TextStyle s36;
  final TextStyle s40;
}

extension TextStyleExt on TextStyle {
  TextStyle bold({Color? color}) {
    if (color == null) {
      return copyWith(fontWeight: FontWeight.w700);
    } else {
      return copyWith(fontWeight: FontWeight.w700, color: color);
    }
  }

  TextStyle w500({Color? color}) {
    if (color == null) {
      return copyWith(fontWeight: FontWeight.w500);
    } else {
      return copyWith(fontWeight: FontWeight.w500, color: color);
    }
  }

  TextStyle sp() => copyWith(fontSize: fontSize!.sp);
  TextStyle underline() => copyWith(decoration: TextDecoration.underline);

  TextStyle fontColor(Color color) => copyWith(color: color);
  TextStyle bg(Color color) => copyWith(backgroundColor: color);

  TextStyle comfort() => copyWith(height: 1.8);

  TextStyle dense() => copyWith(height: 1.2);
}
