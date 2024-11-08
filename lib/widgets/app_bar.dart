import 'package:my_boat/themes/colors.dart';
import 'package:my_boat/themes/styles.dart';
import 'package:my_boat/utils/asset_icons.dart';
import 'package:my_boat/widgets/back_button.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool showLeadingIcon;
  final VoidCallback? onTapBack;
  final String? title;
  final List<Widget>? actions;
  final Color? color;
  final Widget? titleWidget;
  final String leadingIcon;
  final bool showPreferenceBar;
  final bool showCustomPreferenceBar;
  final PreferredSizeWidget? customPreferenceBar;
  final double leadingPadding;

  const CustomAppBar({
    super.key,
    this.showLeadingIcon = true,
    this.onTapBack,
    this.title,
    this.actions,
    this.color = Colors.white,
    this.titleWidget,
    this.leadingIcon = AssetIcons.backButton,
    this.showPreferenceBar = true,
    this.showCustomPreferenceBar = false,
    this.customPreferenceBar,
    this.leadingPadding = 0,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: color,
      leading: showLeadingIcon
          ? AppBackButton(
              leadingIcon: leadingIcon,
              leadingPadding: leadingPadding,
              onTap: onTapBack)
          : const SizedBox(),
      title: titleWidget ??
          (title == null
              ? null
              : Text(
                  title!,
                  style:
                      semiBoldTextStyle(color: AppColors.black, fontSize: 16),
                )),
      actions: actions,
      bottom: showPreferenceBar
          ? showCustomPreferenceBar
              ? customPreferenceBar
              : PreferredSize(
                  preferredSize: const Size.fromHeight(1.0),
                  child: Container(
                    color: AppColors.cE8DECF,
                    height: 1.0,
                  ),
                )
          : null,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
