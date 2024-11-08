import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:my_boat/themes/colors.dart';
import 'package:my_boat/utils/asset_icons.dart';
import 'package:my_boat/utils/scalling.dart';
import 'package:my_boat/widgets/back_button.dart';
import 'package:my_boat/widgets/badge_widget.dart';
import 'package:my_boat/widgets/clickable.dart';
import 'package:my_boat/widgets/horizontal_space.dart';

class SearchAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool showLeadingIcon;
  final bool isLeadingIconBack;
  final VoidCallback? onTapBack;
  final VoidCallback? onTapFilter;
  final List<Widget>? actions;
  final Color? color;
  final Widget searchWidget;
  final String leadingIcon;
  final bool showFavouriteBtn;
  final bool showPreferenceBar;

  const SearchAppBar({
    super.key,
    required this.searchWidget,
    this.showLeadingIcon = true,
    this.isLeadingIconBack = true,
    this.showFavouriteBtn = false,
    this.onTapFilter,
    this.onTapBack,
    this.actions,
    this.color = Colors.white,
    this.leadingIcon = AssetIcons.backButton,
    this.showPreferenceBar = false,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: color,
      leading: showLeadingIcon
          ? isLeadingIconBack
              ? Padding(
                  padding: EdgeInsets.only(left: 10.w),
                  child:
                      AppBackButton(leadingIcon: leadingIcon, onTap: onTapBack),
                )
              : Clickable(
                  onTap: onTapBack,
                  child: Padding(
                    padding: EdgeInsets.only(left: 24.w),
                    child: Image.asset(AssetIcons.user, scale: 4.5),
                  ),
                )
          : null,
      titleSpacing: 0.0,
      title: Padding(
        padding: const EdgeInsets.only(left: 8, right: 2),
        child: searchWidget,
      ),
      actions: [
        Clickable(
          onTap: onTapFilter,
          child: BadgeWidget(
              icon: AssetIcons.filter,
              position: badges.BadgePosition.topStart()),
        ),
        if (showFavouriteBtn)
          Row(
            children: [
              const HorizontalSpace(width: 5),
              Clickable(
                onTap: () {
                  // pushToName(RoutesNames.favouritePage);
                },
                child:
                    const BadgeWidget(icon: AssetIcons.favourite, scaling: 3.5),
              ),
            ],
          ),
        const HorizontalSpace(width: 24)
      ],
      bottom: showPreferenceBar
          ? PreferredSize(
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
