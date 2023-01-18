import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'app_colors.dart';
import 'app_text_theme.dart';

export 'app_text_theme.dart' show TextStyleExt;

final appThemeModeProvider = StateNotifierProvider<StateController<ThemeMode>, ThemeMode>(
  (ref) => StateController(ThemeMode.light),
);

final appThemeProvider = Provider<AppTheme>(
  (ref) {
    final mode = ref.watch(appThemeModeProvider);
    switch (mode) {
      case ThemeMode.dark:
        return AppTheme.dark();
      case ThemeMode.light:
      default:
        return AppTheme.light();
    }
  },
);

class AppTheme {
  AppTheme({
    required this.mode,
    required this.data,
    required this.textTheme,
    required this.appColors,
  });

  factory AppTheme.light() {
    const mode = ThemeMode.light;
    final appColors = AppColors.light();
    final themeData = ThemeData.light().copyWith(
      primaryTextTheme: TextTheme(
        displayLarge: TextStyle(inherit: true, color: appColors.primary),
        displayMedium: TextStyle(inherit: true, color: appColors.primary),
        displaySmall: TextStyle(inherit: true, color: appColors.primary),
        headlineLarge: TextStyle(inherit: true, color: appColors.primary),
        headlineMedium: TextStyle(inherit: true, color: appColors.primary),
        headlineSmall: TextStyle(inherit: true, color: appColors.primary),
        titleLarge: TextStyle(inherit: true, color: appColors.primary),
        titleMedium: TextStyle(inherit: true, color: appColors.primary),
        titleSmall: TextStyle(inherit: true, color: appColors.primary),
        bodyLarge: TextStyle(inherit: true, color: appColors.primary),
        bodyMedium: TextStyle(inherit: true, color: appColors.primary),
        bodySmall: TextStyle(inherit: true, color: appColors.primary),
        labelLarge: TextStyle(inherit: true, color: appColors.primary),
        labelMedium: TextStyle(inherit: true, color: appColors.primary),
        labelSmall: TextStyle(inherit: true, color: appColors.primary),
      ),
      scaffoldBackgroundColor: appColors.background,
      hintColor: Colors.grey,
      textTheme: GoogleFonts.notoSansTextTheme(ThemeData.light().textTheme),
      appBarTheme: AppBarTheme(backgroundColor: appColors.background, foregroundColor: appColors.primary),
      inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.all(8.0),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: appColors.border,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: appColors.primary,
            ),
          )),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            primary: appColors.primary,
            onPrimary: appColors.primaryButtonText,
            onSurface: appColors.disabledButton,
            // onSurface: appColors.backgroundGray,
            textStyle: AppTextTheme(appColors).s18.bold(),
            minimumSize: const Size.fromHeight(40)),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          backgroundColor: appColors.outline,
          primary: appColors.outlineButtonText,
          textStyle: AppTextTheme(appColors).s18.bold(),
          minimumSize: const Size.fromHeight(40),
          side: BorderSide(color: appColors.outlineButtonText),
        ),
      ),
      toggleButtonsTheme: ToggleButtonsThemeData(
        selectedColor: appColors.primary,
        selectedBorderColor: appColors.primary,
        color: appColors.primaryButtonText,
      ),
    );
    return AppTheme(
      mode: mode,
      data: themeData,
      textTheme: AppTextTheme(appColors),
      appColors: appColors,
    );
  }

  factory AppTheme.dark() {
    const mode = ThemeMode.dark;
    final appColors = AppColors.dark();
    final themeData = ThemeData.dark().copyWith(
      scaffoldBackgroundColor: appColors.background,
      hintColor: Colors.grey,
      textTheme: GoogleFonts.notoSansTextTheme(ThemeData.dark().textTheme),
      appBarTheme: AppBarTheme(backgroundColor: appColors.background),
      inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.all(8.0),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: appColors.border,
            ),
          )),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            primary: appColors.primary,
            onPrimary: appColors.primaryButtonText,
            textStyle: AppTextTheme(appColors).s18.bold(),
            minimumSize: const Size.fromHeight(40)),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
        backgroundColor: appColors.outline,
        primary: appColors.outlineButtonText,
        textStyle: AppTextTheme(appColors).s18.bold(),
        minimumSize: const Size.fromHeight(40),
        side: BorderSide(color: appColors.outlineButtonText),
      )),
      toggleButtonsTheme: ToggleButtonsThemeData(
        selectedColor: appColors.primary,
        selectedBorderColor: appColors.primary,
        color: appColors.primaryButtonText,
      ),
    );
    return AppTheme(
      mode: mode,
      data: themeData,
      textTheme: AppTextTheme(appColors),
      appColors: appColors,
    );
  }

  final ThemeMode mode;
  final ThemeData data;
  final AppTextTheme textTheme;
  final AppColors appColors;
}
