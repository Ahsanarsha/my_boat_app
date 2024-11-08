import 'package:my_boat/routes/routes_names.dart';
import 'package:my_boat/themes/colors.dart';
import 'package:my_boat/themes/styles.dart';
import 'package:my_boat/utils/asset_icons.dart';
import 'package:my_boat/utils/exports.dart';
import 'package:my_boat/utils/helper.dart';
import 'package:my_boat/utils/scalling.dart';
import 'package:my_boat/widgets/button.dart';
import 'package:my_boat/widgets/horizontal_space.dart';
import 'package:my_boat/widgets/vertical_space.dart';
import 'package:flutter/material.dart';

class UpdateProfileInstructionsPage extends StatelessWidget {
  const UpdateProfileInstructionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const VerticalSpace(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(AssetIcons.registerProgress1, scale: 4),
              ],
            ),
            const VerticalSpace(height: 130),
            Image.asset(AssetIcons.accountColor, scale: 4),
            const VerticalSpace(height: 20),
            Text(
              AppLocalizations.of(context)!.updateYourProfile,
              style: regularTextStyle(fontSize: 28, color: AppColors.c0B2253),
            ),
            Text(
              AppLocalizations.of(context)!.letsGetYou,
              style: regularTextStyle(color: AppColors.c9DA9B3, fontSize: 18),
            ),
            const VerticalSpace(height: 26),
            AppButton(
              isHeightRequired: false,
              radius: 12,
              backgroundColor: AppColors.cFAFAFA,
              border: Border.all(color: AppColors.cE7E7E7),
              showBorder: true,
              margin: EdgeInsets.symmetric(horizontal: 26.w),
              padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 18.h),
              titleWidget: Column(
                children: [
                  Row(
                    children: [
                      Image.asset(AssetIcons.listCheck, scale: 4),
                      const HorizontalSpace(width: 12),
                      Text(
                        AppLocalizations.of(context)!.profileSetup,
                        style: regularTextStyle(color: AppColors.c81909D),
                      ),
                    ],
                  ),
                  const VerticalSpace(height: 5),
                  Row(
                    children: [
                      Image.asset(AssetIcons.listCheck, scale: 4),
                      const HorizontalSpace(width: 12),
                      Text(
                        AppLocalizations.of(context)!.locationSetup,
                        style: regularTextStyle(color: AppColors.c81909D),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppButton(
              margin: EdgeInsets.symmetric(horizontal: 20.w),
              title: AppLocalizations.of(context)!.proceedToProfileCreation,
              onTap: () async {
                pushAndRemoveAllRoutesName(RoutesNames.updateProfile);
              },
            ),
            SizedBox(height: 60.h),
          ],
        ),
      ),
    );
  }
}
