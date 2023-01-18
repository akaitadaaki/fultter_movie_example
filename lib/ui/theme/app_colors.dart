import 'package:flutter/material.dart';

class AppColors {
  const AppColors(
      {required this.primary,
      required this.primaryButtonText,
      required this.disabledButton,
      required this.outline,
      required this.outlineButtonText,
      required this.background,
      required this.containerBackground,
      required this.containerBackgroundSecondery,
      required this.border,
      required this.divider,
      required this.shadow,
      required this.backgroundGray,
      required this.pieColorPrimary,
      required this.pieColorSecondery,
      required this.textColorBase,
      required this.textColorGray,
      required this.textColorBlack,
      required this.textColorPrimary,
      required this.textColorAlert,
      required this.textColorError,
      required this.fabBackground,
      required this.backgroundColorAlert,
      required this.primaryGradationFirst,
      required this.primaryGradationLast});

  factory AppColors.light() {
    return const AppColors(
      primary: Color(0xff2d9cdb),
      primaryButtonText: Color(0xffffffff),
      disabledButton: Color(0xff999999),
      outline: Color(0xffffffff),
      outlineButtonText: Color(0xff2d9cdb),
      background: Color(0xfff2f6f9),
      containerBackground: Color(0xffffffff),
      containerBackgroundSecondery: Color(0xffc8e2fa),
      border: Color(0xffaaaaaa),
      divider: Color(0xffcccccc),
      shadow: Color.fromRGBO(29, 29, 29, 0.2),
      backgroundGray: Color(0xffeeeeee),
      pieColorPrimary: Color(0xfff091c2),
      pieColorSecondery: Color(0xffcccccc),
      textColorBase: Color(0xff343A40),
      textColorGray: Color(0xffaaaaaa),
      textColorBlack: Color(0xFF000000),
      textColorPrimary: Color(0xff2d9cdb),
      textColorAlert: Color(0xffdc3545),
      textColorError: Color(0xffeb5757),
      fabBackground: Color(0xff9ecff2),
      backgroundColorAlert: Color(0x19eb5757),
      primaryGradationFirst: Color(0xff2d9cdb),
      primaryGradationLast: Color(0xff7cd0ff),
    );
  }

  factory AppColors.dark() {
    return const AppColors(
      primary: Color(0xff2d9cdb),
      primaryButtonText: Color(0xff121212),
      disabledButton: Color(0xff999999),
      outline: Color(0xff121212),
      outlineButtonText: Color(0xff2d9cdb),
      background: Color(0xff121212),
      containerBackground: Color(0xff000000),
      containerBackgroundSecondery: Color(0xffc8e2fa),
      border: Color(0xffaaaaaa),
      divider: Color(0xffcccccc),
      shadow: Color.fromRGBO(29, 29, 29, 0.2),
      backgroundGray: Color(0xffeeeeee),
      pieColorPrimary: Color(0xfff091c2),
      pieColorSecondery: Color(0xffcccccc),
      textColorBase: Color(0xffffffff),
      textColorGray: Color(0xffaaaaaa),
      textColorBlack: Color(0xFF000000),
      textColorPrimary: Color(0xff2d9cdb),
      textColorAlert: Color(0xffdc3545),
      textColorError: Color(0xffeb5757),
      fabBackground: Color(0xff9ecff2),
      backgroundColorAlert: Color(0x19eb5757),
      primaryGradationFirst: Color(0xff2d9cdb),
      primaryGradationLast: Color(0xff7cd0ff),
    );
  }

  final Color primary;
  final Color primaryButtonText;
  final Color disabledButton;
  final Color outline;
  final Color outlineButtonText;
  final Color background;
  final Color containerBackground;
  final Color containerBackgroundSecondery;
  final Color border;
  final Color divider;
  final Color shadow;
  final Color backgroundGray;
  final Color pieColorPrimary;
  final Color pieColorSecondery;
  final Color textColorBase;
  final Color textColorPrimary;
  final Color textColorGray;
  final Color textColorBlack;
  final Color textColorAlert;
  final Color textColorError;
  final Color fabBackground;
  final Color backgroundColorAlert;
  final Color primaryGradationFirst;
  final Color primaryGradationLast;
}
