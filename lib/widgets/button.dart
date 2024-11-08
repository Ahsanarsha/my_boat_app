import 'package:my_boat/themes/colors.dart';
import 'package:my_boat/themes/styles.dart';
import 'package:my_boat/utils/scalling.dart';
import 'package:my_boat/widgets/clickable.dart';
import 'package:my_boat/widgets/loader.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String? title;
  final Widget? titleWidget;
  final VoidCallback? onTap;
  final EdgeInsets? margin;
  final Color backgroundColor;
  final Color? loaderColor;
  final Color? titleColor;
  final Color borderColor;
  final bool showLoader;
  final EdgeInsetsGeometry? padding;
  final double radius;
  final TextStyle? textStyle;
  final bool enable;
  final double? height;
  final CrossAxisAlignment crossAxisAlignment;
  final bool isHeightRequired;
  final bool rensponsiveHeight;
  final BoxBorder? border;
  final bool showBorder;
  final bool isExpanded;
  final bool showLeadingIcon;
  final bool showTrailingIcon;
  final bool changeTitleColor;
  final bool isUpperCase;
  final MainAxisSize mainAxisSize;
  final String? buttonIcon;
  final double? scale;
  final Color? iconColor;

  const AppButton({
    super.key,
    this.title,
    this.onTap,
    this.margin = const EdgeInsets.all(0),
    this.backgroundColor = AppColors.primary,
    this.borderColor = AppColors.primary,
    this.showLoader = false,
    this.padding = EdgeInsets.zero,
    this.radius = 30,
    this.textStyle,
    this.enable = true,
    this.height = 49,
    this.loaderColor,
    this.titleColor,
    this.titleWidget,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.isHeightRequired = true,
    this.rensponsiveHeight = true,
    this.border,
    this.showBorder = false,
    this.isExpanded = false,
    this.showLeadingIcon = false,
    this.showTrailingIcon = false,
    this.changeTitleColor = false,
    this.isUpperCase = true,
    this.mainAxisSize = MainAxisSize.max,
    this.buttonIcon,
    this.scale,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Clickable(
      onTap: !showLoader && enable && onTap != null ? onTap : () {},
      child: Container(
        margin: margin,
        height: !isHeightRequired
            ? null
            : rensponsiveHeight
                ? height!.h
                : height,
        padding: padding,
        decoration: BoxDecoration(
          border: !showBorder
              ? null
              : border ?? Border.all(color: borderColor, width: 1.5),
          color: !showLoader && enable ? backgroundColor : AppColors.primary,
          borderRadius: BorderRadius.all(Radius.circular(radius)),
        ),
        child: titleWidget ??
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: crossAxisAlignment,
              mainAxisSize: mainAxisSize,
              children: [
                showLoader
                    ? const SizedBox(
                        height: 20,
                        width: 20,
                        child: AppLoader(),
                      )
                    : isExpanded
                        ? Expanded(
                            child: Text(
                              title!,
                              textAlign: TextAlign.center,
                              style: textStyle ??
                                  semiBoldTextStyle(
                                    color: AppColors.white,
                                  ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          )
                        : Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.w),
                            child: Row(
                              children: [
                                if (showLeadingIcon)
                                  Padding(
                                    padding: EdgeInsets.only(right: 6.5.w),
                                    child: Image.asset(
                                      buttonIcon!,
                                      scale: scale ?? 5,
                                      color: iconColor,
                                    ),
                                  ),
                                Text(
                                  isUpperCase ? title!.toUpperCase() : title!,
                                  style: textStyle ??
                                      semiBoldTextStyle(
                                        color: changeTitleColor
                                            ? titleColor!
                                            : backgroundColor ==
                                                    Colors.transparent
                                                ? AppColors.primary
                                                : AppColors.white,
                                        fontSize: 14,
                                      ),
                                ),
                                if (showTrailingIcon)
                                  Padding(
                                    padding: EdgeInsets.only(left: 4.w),
                                    child: Image.asset(
                                      buttonIcon!,
                                      scale: scale ?? 4,
                                      color: iconColor,
                                    ),
                                  ),
                              ],
                            ),
                          ),
              ],
            ),
      ),
    );
  }
}
