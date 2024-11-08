import 'package:my_boat/utils/scalling.dart';
import 'package:flutter/material.dart';
import 'package:my_boat/themes/colors.dart';
import 'package:my_boat/themes/font_weights.dart';

TextStyle regularTextStyle({
  FontWeight fontWeight = AppFontWeights.regular,
  Color color = AppColors.black,
  double fontSize = 16,
  double? height,
  TextDecoration textDecoration = TextDecoration.none,
}) =>
    TextStyle(
      height: height,
      color: color,
      fontSize: fontSize.w,
      fontWeight: fontWeight,
      decoration: textDecoration,
    );

TextStyle mediumTextStyle({
  FontWeight fontWeight = AppFontWeights.medium,
  Color color = AppColors.black,
  double fontSize = 18,
}) =>
    TextStyle(
      color: color,
      fontSize: fontSize.w,
      fontWeight: fontWeight,
    );

TextStyle semiBoldTextStyle({
  FontWeight fontWeight = AppFontWeights.semiBold,
  Color color = AppColors.black,
  double fontSize = 18,
}) =>
    TextStyle(
      color: color,
      fontSize: fontSize.w,
      fontWeight: fontWeight,
    );

TextStyle boldTextStyle({
  FontWeight fontWeight = AppFontWeights.bold,
  Color color = AppColors.black,
  double fontSize = 24,
}) =>
    TextStyle(
      color: color,
      fontSize: fontSize.w,
      fontWeight: fontWeight,
    );
