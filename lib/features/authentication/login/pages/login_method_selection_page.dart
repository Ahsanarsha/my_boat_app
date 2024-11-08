import 'package:my_boat/routes/routes_names.dart';
import 'package:my_boat/themes/colors.dart';
import 'package:my_boat/themes/styles.dart';
import 'package:my_boat/utils/asset_icons.dart';
import 'package:my_boat/utils/exports.dart';
import 'package:my_boat/utils/extensions.dart';
import 'package:my_boat/utils/helper.dart';
import 'package:my_boat/utils/scalling.dart';
import 'package:my_boat/widgets/button.dart';
import 'package:my_boat/widgets/horizontal_space.dart';
import 'package:my_boat/widgets/vertical_space.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LoginMethodSelectionPage extends StatelessWidget {
  const LoginMethodSelectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            bottom: 50.h,
            child: Image.asset(AssetIcons.authSideBg, scale: 4),
          ),
          Column(
            children: [
              Stack(
                children: [
                  const VerticalSpace(height: 391),
                  Container(
                    height: 363.h,
                    width: MediaQuery.sizeOf(context).width,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(90),
                        bottomRight: Radius.circular(90),
                      ),
                      image: DecorationImage(
                        image: AssetImage(AssetIcons.greenBg),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(90),
                          bottomRight: Radius.circular(90),
                        ),
                        image: DecorationImage(
                          image: AssetImage(AssetIcons.couple),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 335.h,
                    left: MediaQuery.sizeOf(context).width / 2 - 89.5.w,
                    right: MediaQuery.sizeOf(context).width / 2 - 89.5.w,
                    child: Image.asset(
                      AssetIcons.logoTitleBorder,
                      height: 56.h,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40.w),
                child: Column(
                  children: [
                    const VerticalSpace(height: 30),
                    Text(
                      AppLocalizations.of(context)!.letsGetStarted,
                      style: semiBoldTextStyle(
                        color: AppColors.c0B2253,
                      ),
                    ),
                    const VerticalSpace(height: 30),
                    AppButton(
                      radius: 8,
                      titleWidget: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(AssetIcons.mail, scale: 4),
                          const HorizontalSpace(width: 12),
                          Text(
                            AppLocalizations.of(context)!.signInWithEmail,
                            style: semiBoldTextStyle(
                                color: AppColors.white, fontSize: 14),
                          ),
                        ],
                      ),
                      onTap: () => pushToAndReplaceName(RoutesNames.login),
                    ),
                    const VerticalSpace(height: 25),
                    Row(
                      children: [
                        const Expanded(
                          child: Divider(
                              height: 0,
                              thickness: 1,
                              color: AppColors.cD9D9D9),
                        ),
                        const HorizontalSpace(width: 12),
                        Text(AppLocalizations.of(context)!.or,
                            style: semiBoldTextStyle()),
                        const HorizontalSpace(width: 12),
                        const Expanded(
                          child: Divider(
                              height: 0,
                              thickness: 1,
                              color: AppColors.cD9D9D9),
                        ),
                      ],
                    ),
                    const VerticalSpace(height: 20),
                    AppButton(
                      onTap: () {
                        'Feature coming soon'.showToast();
                      },
                      radius: 8,
                      showBorder: true,
                      backgroundColor: Colors.transparent,
                      border: Border.all(color: AppColors.cC1C8CE),
                      titleWidget: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(AssetIcons.google, scale: 4),
                          const HorizontalSpace(width: 12),
                          Text(
                            AppLocalizations.of(context)!.signinWithGoogle,
                            style: semiBoldTextStyle(
                                color: AppColors.c030F08, fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                    const VerticalSpace(height: 20),
                    AppButton(
                      onTap: () {
                        'Feature coming soon'.showToast();
                      },
                      radius: 8,
                      showBorder: true,
                      backgroundColor: Colors.transparent,
                      border: Border.all(color: AppColors.cC1C8CE),
                      titleWidget: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(AssetIcons.apple, scale: 4),
                          const HorizontalSpace(width: 12),
                          Text(
                            AppLocalizations.of(context)!.signInWithApple,
                            style: semiBoldTextStyle(
                                color: AppColors.c030F08, fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                    const VerticalSpace(height: 25),
                    Text.rich(
                      TextSpan(
                        text:
                            '${AppLocalizations.of(context)!.dontHaveAnAccount} ',
                        style: regularTextStyle(
                          color: AppColors.c6D7A98,
                          fontSize: 16,
                        ),
                        children: [
                          TextSpan(
                            text: AppLocalizations.of(context)!.signUp,
                            style: semiBoldTextStyle(
                              color: AppColors.primary,
                              fontSize: 16,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                pushToAndReplaceName(
                                    RoutesNames.registrationMethodSelection2);
                              },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
