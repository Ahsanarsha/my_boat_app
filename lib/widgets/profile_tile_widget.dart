import 'package:my_boat/themes/colors.dart';
import 'package:my_boat/themes/styles.dart';
import 'package:my_boat/utils/scalling.dart';
import 'package:my_boat/widgets/horizontal_space.dart';
import 'package:flutter/material.dart';

class ProfileTileWidget extends StatelessWidget {
  final String? profileImage;
  final double profileImageWidth;
  final String? heading;
  final String? subHeading;
  final bool showSubHeadingTitle;
  final String? subHeadingTitle;
  final bool showMenu;
  final String? menuText;
  final double headingFontSize;
  final Color subHeadingColor;
  const ProfileTileWidget({
    super.key,
    this.profileImage,
    this.profileImageWidth = 36,
    this.heading,
    this.subHeadingTitle,
    this.subHeading,
    this.showSubHeadingTitle = false,
    this.showMenu = true,
    this.menuText,
    this.headingFontSize = 14,
    this.subHeadingColor = AppColors.c717785,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(profileImage!, width: profileImageWidth.w),
        HorizontalSpace(width: 8.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                heading!,
                style: mediumTextStyle(fontSize: headingFontSize),
              ),
              Row(
                children: [
                  if (showSubHeadingTitle)
                    Text(
                      subHeadingTitle!,
                      style: mediumTextStyle(
                          fontSize: 12, color: AppColors.c848A98),
                    ),
                  Text(
                    subHeading!,
                    style:
                        mediumTextStyle(fontSize: 12, color: subHeadingColor),
                  ),
                ],
              ),
            ],
          ),
        ),
        if (showMenu)
          PopupMenuButton<String>(
            onSelected: (value) {},
            itemBuilder: (BuildContext context) {
              return [menuText!].map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  height: 35.h,
                  child: Text(choice),
                );
              }).toList();
            },
            icon: Container(
              height: 35.h,
              width: 35.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.white,
                border: Border.all(color: AppColors.cEDE6DB),
              ),
              child: const Icon(Icons.more_horiz,
                  color: AppColors.c8E8E8E, size: 16),
            ),
          ),
      ],
    );
  }
}
