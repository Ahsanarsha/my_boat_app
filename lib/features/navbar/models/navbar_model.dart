import 'package:my_boat/themes/colors.dart';
import 'package:flutter/material.dart';

class NavbarModel {
  final String assetIconPath;
  final Color activeAssetIconColor;
  final String text;
  final Widget view;

  NavbarModel({
    required this.assetIconPath,
    this.activeAssetIconColor = AppColors.primary,
    required this.text,
    required this.view,
  });
}
