import 'package:my_boat/routes/routes_names.dart';
import 'package:my_boat/themes/colors.dart';
import 'package:my_boat/themes/styles.dart';
import 'package:my_boat/utils/asset_icons.dart';
import 'package:my_boat/utils/exports.dart';
import 'package:my_boat/utils/extensions.dart';
import 'package:my_boat/utils/helper.dart';
import 'package:my_boat/utils/scalling.dart';
import 'package:my_boat/widgets/button.dart';
import 'package:my_boat/widgets/clickable.dart';
import 'package:my_boat/widgets/hide_keyboard.dart';
import 'package:my_boat/widgets/horizontal_space.dart';
import 'package:my_boat/widgets/input_field.dart';
import 'package:my_boat/widgets/sign_up_circular_button.dart';
import 'package:my_boat/widgets/vertical_space.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final GlobalKey<FormState> emailFormKey;
  late final GlobalKey<FormState> passwordFormKey;
  late final FocusNode emailFocus;
  late final FocusNode passwordFocus;
  late final TextEditingController emailController;
  late final TextEditingController passwordController;

  bool loading = false;

  @override
  void initState() {
    emailFormKey = GlobalKey<FormState>();
    passwordFormKey = GlobalKey<FormState>();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    emailFocus = FocusNode();
    passwordFocus = FocusNode();

    super.initState();
  }

  @override
  void dispose() {
    emailFocus.dispose();
    passwordFocus.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return HideKeyboardOnOutsideTap(
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                children: [
                  const VerticalSpace(height: 35.66),
                  Text(
                    AppLocalizations.of(context)!.letsGetStarted,
                    style: boldTextStyle(fontSize: 26),
                  ),
                  const VerticalSpace(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.signIn.toUpperCase(),
                        style: mediumTextStyle(fontSize: 13),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.w),
                        child: CupertinoSwitch(
                          value: false,
                          activeColor: AppColors.primary,
                          onChanged: (value) =>
                              pushToAndReplaceName(RoutesNames.register),
                        ),
                      ),
                      Text(
                        AppLocalizations.of(context)!.signUp.toUpperCase(),
                        style: mediumTextStyle(
                          fontSize: 13,
                          color: AppColors.c636C73,
                        ),
                      ),
                    ],
                  ),

                  ///Email Field
                  ...[
                    const VerticalSpace(height: 32),
                    Row(
                      children: [
                        Text(
                          '${AppLocalizations.of(context)!.emailUsername}*',
                          style: regularTextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                    const VerticalSpace(height: 4),
                    Form(
                      key: emailFormKey,
                      child: AppInputField(
                        controller: emailController,
                        focusNode: emailFocus,
                        name: AppLocalizations.of(context)!.emailUsername,
                        hint:
                            AppLocalizations.of(context)!.enterEmailOrUsername,
                        textInputType: TextInputType.emailAddress,
                        onChanged: (value) {
                          emailFormKey.currentState!.validate();
                        },
                        onFieldSubmitted: (value) {
                          emailFormKey.currentState!.validate();
                        },
                      ),
                    ),
                  ],

                  ///Password Field
                  ...[
                    const VerticalSpace(height: 16),
                    Row(
                      children: [
                        Text(
                          '${AppLocalizations.of(context)!.confirmPassword}*',
                          style: regularTextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                    const VerticalSpace(height: 4),
                    Form(
                      key: passwordFormKey,
                      child: AppInputField(
                        controller: passwordController,
                        focusNode: passwordFocus,
                        isLoginPassword: true,
                        name: AppLocalizations.of(context)!.confirmPassword,
                        hint:
                            AppLocalizations.of(context)!.enterConfirmPassword,
                        textInputType: TextInputType.visiblePassword,
                        textInputAction: TextInputAction.done,
                        onChanged: (value) {
                          passwordFormKey.currentState!.validate();
                        },
                        onFieldSubmitted: (value) {
                          passwordFormKey.currentState!.validate();
                        },
                        validator: (value) {
                          if (value.isNotEmpty && value.length < 8) {
                            return AppLocalizations.of(context)!
                                .passwordShouldbeMinimum;
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                  const VerticalSpace(height: 16),
                  Row(
                    children: [
                      Clickable(
                        onTap: () => pushToName(RoutesNames.forgotPassword),
                        child: SizedBox(
                          height: 50.h,
                          child: Text(
                            '${AppLocalizations.of(context)!.forgotPassword}?',
                            style: regularTextStyle(
                                fontSize: 12,
                                textDecoration: TextDecoration.underline),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const VerticalSpace(height: 24),
                  AppButton(
                    margin: EdgeInsets.symmetric(horizontal: 20.w),
                    title: AppLocalizations.of(context)!.signIn,
                    showLoader: loading,
                    onTap: () async {
                      // var appLoc = AppLocalizations.of(context)!;
                      if (isFormValidate()) {
                        loading = true;
                        setState(() {});
                        await Future.delayed(const Duration(seconds: 2));
                        loading = false;
                        setState(() {});
                        // appLoc.featureComingSoon.showToast();
                        'Welcome ${emailController.text}'.showToast();
                        pushToAndReplaceName(RoutesNames.navbarPageRoute);
                      }
                    },
                  ),
                  const VerticalSpace(height: 24),
                  Row(
                    children: [
                      const Expanded(
                        child: Divider(
                          color: AppColors.cD6D6D6,
                          thickness: 1,
                        ),
                      ),
                      Container(
                        height: 27.h,
                        padding: EdgeInsets.symmetric(horizontal: 6.w),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(22),
                          border: Border.all(color: AppColors.cD6D6D6),
                        ),
                        child: Text(
                          AppLocalizations.of(context)!.orSignUpWith,
                          style: mediumTextStyle(fontSize: 12),
                        ),
                      ),
                      const Expanded(
                        child: Divider(
                          color: AppColors.cD6D6D6,
                          thickness: 1,
                        ),
                      ),
                    ],
                  ),
                  const VerticalSpace(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SignUpCircularButton(
                          assetPath: AssetIcons.google, onTap: () {}),
                      const HorizontalSpace(width: 8),
                      SignUpCircularButton(
                          assetPath: AssetIcons.facebook, onTap: () {}),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  bool isFormValidate() {
    bool isValidate = true;
    if (!emailFormKey.currentState!.validate()) {
      isValidate = false;
    }
    if (!passwordFormKey.currentState!.validate()) {
      isValidate = false;
    }

    return isValidate;
  }
}
