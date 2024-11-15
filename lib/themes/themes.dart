import 'package:flutter/material.dart';
import 'package:my_boat/themes/colors.dart';
import 'package:my_boat/themes/font_weights.dart';
import 'package:my_boat/utils/constants.dart';

abstract class AppThemeData {
  static ThemeData get theme {
    return ThemeData(
      useMaterial3: true,
      fontFamily: Constants.interFontFamily,
      // primaryColor: AppColors.primary,
      scaffoldBackgroundColor: AppColors.white,
      iconTheme: const IconThemeData(color: AppColors.black),
      colorScheme: const ColorScheme.light().copyWith(
        primary: AppColors.primary,
        secondary: AppColors.primary,
        // error: AppColors.error,
      ),
      inputDecorationTheme: const InputDecorationTheme(
        errorStyle: TextStyle(
          color: AppColors.error,
          fontSize: 12,
          fontWeight: AppFontWeights.regular,
        ),
      ),
      appBarTheme: const AppBarTheme(
        elevation: 0,
        backgroundColor: AppColors.primary,
        centerTitle: true,
        surfaceTintColor: Colors.transparent,
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.white,
      ),
      snackBarTheme: const SnackBarThemeData(
        actionTextColor: AppColors.white,
        backgroundColor: AppColors.primary,
        contentTextStyle: TextStyle(color: AppColors.white),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8))),
      ),
    );
  }
}
