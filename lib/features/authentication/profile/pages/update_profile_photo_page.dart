import 'dart:ui';

import 'package:my_boat/themes/colors.dart';
import 'package:my_boat/themes/styles.dart';
import 'package:my_boat/utils/asset_icons.dart';
import 'package:my_boat/utils/exports.dart';
import 'package:my_boat/utils/extensions.dart';
import 'package:my_boat/utils/scalling.dart';
import 'package:my_boat/widgets/button.dart';
import 'package:my_boat/widgets/clickable.dart';
import 'package:my_boat/widgets/dynamic_vertical_space.dart';
import 'package:my_boat/widgets/horizontal_space.dart';
import 'package:my_boat/widgets/vertical_space.dart';
import 'package:flutter/material.dart';

class UpdateProfilePhotoPage extends StatelessWidget {
  const UpdateProfilePhotoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(.5),
      body: Stack(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 0.0, sigmaY: 0.0),
              child: Container(
                color: AppColors.black.withOpacity(0.3),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 6.h,
                  width: 30.w,
                  decoration: BoxDecoration(
                    color: AppColors.white.withOpacity(.6),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(100),
                    ),
                  ),
                ),
                SizedBox(height: 6.h),
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                    color: AppColors.white,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [
                          Image.asset(AssetIcons.account2, scale: 4),
                          const HorizontalSpace(width: 10),
                          Text(
                            AppLocalizations.of(context)!.editProfilePic,
                            style: semiBoldTextStyle(
                              color: AppColors.c172B4D,
                            ),
                          ),
                          const Spacer(),
                          Clickable(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Image.asset(AssetIcons.cross, scale: 4),
                          ),
                        ],
                      ),
                      const VerticalSpace(height: 20),
                      AppButton(
                        isHeightRequired: false,
                        radius: 15,
                        backgroundColor: AppColors.cF8FBF7,
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.w, vertical: 20.h),
                        titleWidget: Column(
                          children: [
                            Clickable(
                              onTap: () {
                                'Feature coming soon'.showToast();
                              },
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    AppLocalizations.of(context)!.takePhoto,
                                    style: regularTextStyle(
                                        color: AppColors.c6D7A98),
                                  ),
                                  Image.asset(AssetIcons.camera, scale: 4),
                                ],
                              ),
                            ),
                            Divider(
                                thickness: 1,
                                color: AppColors.cF3F3F3,
                                height: 30.h),
                            Clickable(
                              onTap: () {
                                'Feature coming soon'.showToast();
                              },
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    AppLocalizations.of(context)!.choosePhoto,
                                    style: regularTextStyle(
                                        color: AppColors.c6D7A98),
                                  ),
                                  Image.asset(AssetIcons.gallary, scale: 4),
                                ],
                              ),
                            ),
                            Divider(
                                thickness: 1,
                                color: AppColors.cF3F3F3,
                                height: 30.h),
                            Clickable(
                              onTap: () {
                                'Feature coming soon'.showToast();
                              },
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    AppLocalizations.of(context)!.deletePhoto,
                                    style: regularTextStyle(
                                        color: AppColors.cCA1B1B),
                                  ),
                                  Image.asset(AssetIcons.delete, scale: 4),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const DynamicVerticalSpace(height: 20),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
