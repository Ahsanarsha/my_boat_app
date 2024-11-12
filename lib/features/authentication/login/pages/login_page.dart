import 'package:flutter/material.dart';
import 'package:my_boat/routes/routes_names.dart';
import 'package:my_boat/themes/colors.dart';
import 'package:my_boat/themes/styles.dart';
import 'package:my_boat/utils/asset_icons.dart';
import 'package:my_boat/utils/exports.dart';
import 'package:my_boat/utils/extensions.dart';
import 'package:my_boat/utils/helper.dart';
import 'package:my_boat/widgets/button.dart';
import 'package:my_boat/widgets/clickable.dart';
import 'package:my_boat/widgets/hide_keyboard.dart';
import 'package:my_boat/widgets/horizontal_space.dart';
import 'package:my_boat/widgets/input_field.dart';
import 'package:my_boat/widgets/logo.dart';
import 'package:my_boat/widgets/primary_checkbox.dart';
import 'package:my_boat/widgets/sign_up_circular_button.dart';
import 'package:my_boat/widgets/vertical_space.dart';

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
  bool isTosAccepted = false;

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
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const VerticalSpace(height: 65),
                  const LogoClass(),
                  const VerticalSpace(height: 65),
                  Text(
                    AppLocalizations.of(context)!.welcomeBack,
                    style: boldTextStyle(fontSize: 22),
                  ),
                  const VerticalSpace(height: 5),

                  Text(
                    AppLocalizations.of(context)!.welcomeBackSelect,
                    style: mediumTextStyle(fontSize: 12),
                  ),

                  ///Email Field

                  ...[
                    const VerticalSpace(height: 40),
                    Row(
                      children: [
                        Text(
                          AppLocalizations.of(context)!.email,
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
                        name: AppLocalizations.of(context)!.email,
                        hint: AppLocalizations.of(context)!.enterEmailHere,
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
                    const VerticalSpace(height: 30),
                    Row(
                      children: [
                        Text(
                          AppLocalizations.of(context)!.password,
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
                        name: AppLocalizations.of(context)!.password,
                        hint: AppLocalizations.of(context)!.enterPasswordHere,
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
                  ...[
                    const VerticalSpace(height: 6),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        PrimaryCheckBox(
                          value: isTosAccepted,
                          onTap: () => {
                            setState(() {
                              isTosAccepted = !isTosAccepted;
                            })
                          },
                          labelWidget: Text(
                            AppLocalizations.of(context)!.rememberMe,
                            style: regularTextStyle(
                                fontSize: 15, color: AppColors.c636C73),
                          ),
                        ),
                        Clickable(
                          onTap: () => pushToName(RoutesNames.forgotPassword),
                          child: SizedBox(
                            child: Text(
                              '${AppLocalizations.of(context)!.forgotPassword}?',
                              style: regularTextStyle(
                                  fontSize: 15, color: AppColors.c636C73),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                  const VerticalSpace(height: 30),
                  AppButton(
                    isUpperCase: false,
                    radius: 10,
                    backgroundColor: AppColors.primary,
                    title: AppLocalizations.of(context)!.login,
                    loaderColor: AppColors.white,
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
                  const VerticalSpace(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.dontHaveAnAccount,
                        style: regularTextStyle(fontSize: 15),
                      ),
                      Clickable(
                        onTap: () => pushToName(RoutesNames.register),
                        child: RichText(
                          text: TextSpan(
                            style: regularTextStyle(fontSize: 15),
                            children: [
                              TextSpan(
                                  text:
                                      ' ${AppLocalizations.of(context)!.signUp} ',
                                  style: regularTextStyle(
                                    color: AppColors.primary,
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const VerticalSpace(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Container(
                          height: 111,
                          width: 192,
                          decoration: BoxDecoration(
                              color: AppColors.cF8F8F8,
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SignUpCircularButton(
                                  assetPath: AssetIcons.google, onTap: () {}),
                              const VerticalSpace(height: 10),
                              Text(
                                AppLocalizations.of(context)!
                                    .continueWithGoogle,
                                style: regularTextStyle(fontSize: 13),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const HorizontalSpace(width: 20),
                      Expanded(
                        child: Container(
                          height: 111,
                          width: 192,
                          decoration: BoxDecoration(
                              color: AppColors.cF8F8F8,
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SignUpCircularButton(
                                  assetPath: AssetIcons.facebook, onTap: () {}),
                              const VerticalSpace(height: 10),
                              Text(
                                AppLocalizations.of(context)!
                                    .continueWithFacebook,
                                style: regularTextStyle(fontSize: 13),
                              ),
                            ],
                          ),
                        ),
                      ),
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
