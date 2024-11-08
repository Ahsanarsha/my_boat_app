import 'package:my_boat/themes/colors.dart';
import 'package:my_boat/themes/styles.dart';
import 'package:my_boat/utils/asset_icons.dart';
import 'package:my_boat/widgets/button.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final VoidCallback? onTapButton;
  final MainAxisSize mainAxisSize;
  final bool showLeadingIcon;
  final bool showTrailingIcon;
  final Color? titleColor;
  final Color? borderColor;
  final Color backgroundColor;
  final String? buttonIcon;
  final double? scale;
  final double? height;
  final Color? iconColor;
  final bool isTextSemiBold;

  const CustomButton({
    super.key,
    required this.title,
    this.onTapButton,
    this.mainAxisSize = MainAxisSize.min,
    this.showLeadingIcon = false,
    this.showTrailingIcon = true,
    this.titleColor,
    this.borderColor,
    this.backgroundColor = Colors.transparent,
    this.buttonIcon,
    this.scale,
    this.height = 28,
    this.iconColor,
    this.isTextSemiBold = true,
  });

  @override
  Widget build(BuildContext context) {
    return AppButton(
      title: title,
      isUpperCase: false,
      radius: 39,
      height: height,
      buttonIcon: buttonIcon ?? AssetIcons.visitArrow,
      backgroundColor: backgroundColor,
      showBorder: true,
      borderColor: borderColor ?? AppColors.primary,
      mainAxisSize: mainAxisSize,
      showLeadingIcon: showLeadingIcon,
      iconColor: iconColor,
      textStyle: isTextSemiBold
          ? semiBoldTextStyle(
              color: titleColor ?? AppColors.primary, fontSize: 12)
          : mediumTextStyle(
              color: titleColor ?? AppColors.primary, fontSize: 12),
      showTrailingIcon: showTrailingIcon,
      scale: scale,
      onTap: onTapButton,
    );
  }
}
