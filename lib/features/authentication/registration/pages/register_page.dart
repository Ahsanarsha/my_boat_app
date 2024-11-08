import 'package:my_boat/features/authentication/registration/widgets/password_validation.dart';
import 'package:my_boat/routes/routes_names.dart';
import 'package:my_boat/themes/colors.dart';
import 'package:my_boat/themes/styles.dart';
import 'package:my_boat/utils/asset_icons.dart';
import 'package:my_boat/utils/exports.dart';
import 'package:my_boat/utils/extensions.dart';
import 'package:my_boat/utils/helper.dart';
import 'package:my_boat/utils/regexs.dart';
import 'package:my_boat/utils/scalling.dart';
import 'package:my_boat/widgets/button.dart';
import 'package:my_boat/widgets/hide_keyboard.dart';
import 'package:my_boat/widgets/horizontal_space.dart';
import 'package:my_boat/widgets/input_field.dart';
import 'package:my_boat/widgets/primary_checkbox.dart';
import 'package:my_boat/widgets/sign_up_circular_button.dart';
import 'package:my_boat/widgets/vertical_space.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late final GlobalKey<FormState> referralCodeFormKey;
  late final GlobalKey<FormState> userNameFormKey;
  late final GlobalKey<FormState> emailFormKey;
  late final GlobalKey<FormState> passwordFormKey;
  late final GlobalKey<FormState> confirmPasswordFormKey;

  late final FocusNode referralCodeFocus;
  late final FocusNode userNameFocus;
  late final FocusNode emailFocus;
  late final FocusNode passwordFocus;
  late final FocusNode confirmPasswordFocus;

  late final TextEditingController referralCodeController;
  late final TextEditingController userNameController;
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  late final TextEditingController confirmPasswordController;

  bool loading = false;
  bool isTosAccepted = false;
  String passwordStrength = '';

  @override
  void initState() {
    referralCodeFormKey = GlobalKey<FormState>();
    userNameFormKey = GlobalKey<FormState>();
    emailFormKey = GlobalKey<FormState>();
    passwordFormKey = GlobalKey<FormState>();
    confirmPasswordFormKey = GlobalKey<FormState>();

    referralCodeController = TextEditingController();
    userNameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();

    referralCodeFocus = FocusNode();
    userNameFocus = FocusNode();
    emailFocus = FocusNode();
    passwordFocus = FocusNode();
    confirmPasswordFocus = FocusNode();

    super.initState();
  }

  @override
  void dispose() {
    referralCodeController.dispose();
    userNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();

    referralCodeFocus.dispose();
    userNameFocus.dispose();
    emailFocus.dispose();
    passwordFocus.dispose();
    confirmPasswordFocus.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return HideKeyboardOnOutsideTap(
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
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
                          value: true,
                          activeColor: AppColors.primary,
                          onChanged: (value) =>
                              pushToAndReplaceName(RoutesNames.login),
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

                  /// Referral Code Field...
                  ...[
                    const VerticalSpace(height: 32),
                    Row(
                      children: [
                        Text(
                          AppLocalizations.of(context)!.referralCode,
                          style: regularTextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                    const VerticalSpace(height: 4),
                    Form(
                      key: referralCodeFormKey,
                      child: AppInputField(
                        controller: referralCodeController,
                        focusNode: referralCodeFocus,
                        name: AppLocalizations.of(context)!.referralCode,
                        hint: AppLocalizations.of(context)!.enterReferralCode,
                        textInputType: TextInputType.number,
                        onChanged: (value) {
                          referralCodeFormKey.currentState!.validate();
                        },
                        onFieldSubmitted: (value) {
                          referralCodeFormKey.currentState!.validate();
                        },
                      ),
                    ),
                  ],

                  ///Email Field...
                  ...[
                    const VerticalSpace(height: 16),
                    Row(
                      children: [
                        Text(
                          '${AppLocalizations.of(context)!.email}*',
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
                        hint: AppLocalizations.of(context)!.enterEmailAddress,
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

                  ///UserName Field...
                  ...[
                    const VerticalSpace(height: 16),
                    Row(
                      children: [
                        Text(
                          '${AppLocalizations.of(context)!.username}*',
                          style: regularTextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                    const VerticalSpace(height: 4),
                    Form(
                      key: userNameFormKey,
                      child: AppInputField(
                        controller: userNameController,
                        focusNode: userNameFocus,
                        name: AppLocalizations.of(context)!.username,
                        hint: AppLocalizations.of(context)!.enterUsername,
                        textInputType: TextInputType.name,
                        onChanged: (value) {
                          userNameFormKey.currentState!.validate();
                        },
                        onFieldSubmitted: (value) {
                          userNameFormKey.currentState!.validate();
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
                          '${AppLocalizations.of(context)!.password}*',
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
                        name: AppLocalizations.of(context)!.password,
                        hint: AppLocalizations.of(context)!.enterPassword,
                        textInputType: TextInputType.visiblePassword,
                        textInputAction: TextInputAction.next,
                        isLoginPassword: true,
                        onChanged: (value) {
                          passwordFormKey.currentState!.validate();
                          setState(() {
                            passwordStrength = checkPasswordStrength(value);
                          });
                        },
                        onFieldSubmitted: (value) {
                          passwordFormKey.currentState!.validate();
                          setState(() {
                            passwordStrength = checkPasswordStrength(value);
                          });
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

                  //Password validation check...
                  if (passwordController.text.isNotEmpty) ...[
                    const VerticalSpace(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        PasswordValidationText(
                            text: AppLocalizations.of(context)!
                                .minimum8Characters,
                            isValid: passwordController.text.length >= 8),
                        Text(
                          passwordStrength,
                          style: mediumTextStyle(
                            fontSize: 12,
                            color: passwordStrength == "Strong"
                                ? AppColors.c5BB28C
                                : passwordStrength == "Medium"
                                    ? Colors.yellow
                                    : AppColors.cD98B14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        PasswordValidationText(
                            text: AppLocalizations.of(context)!
                                .oneSpecialCharacters,
                            isValid: passwordController.text.contains(
                                RegExp(AppRegexs.oneSepecialCharacterRegex))),
                        const HorizontalSpace(width: 4),
                        PasswordValidationText(
                            text: AppLocalizations.of(context)!.oneNumber,
                            isValid: passwordController.text
                                .contains(RegExp(AppRegexs.oneNumberRegex))),
                      ],
                    ),
                  ],

                  ///Confirm Password Field
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
                      key: confirmPasswordFormKey,
                      child: AppInputField(
                        controller: confirmPasswordController,
                        focusNode: confirmPasswordFocus,
                        name: AppLocalizations.of(context)!.confirmPassword,
                        hint:
                            AppLocalizations.of(context)!.enterConfirmPassword,
                        textInputType: TextInputType.visiblePassword,
                        isLoginPassword: true,
                        textInputAction: TextInputAction.done,
                        onChanged: (value) {
                          confirmPasswordFormKey.currentState!.validate();
                        },
                        onFieldSubmitted: (value) {
                          confirmPasswordFormKey.currentState!.validate();
                        },
                        validator: (value) {
                          if (value != passwordController.text) {
                            return AppLocalizations.of(context)!
                                .confirmPasswordNotMatch;
                          }
                          return null;
                        },
                      ),
                    ),
                  ],

                  const VerticalSpace(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: PrimaryCheckBox(
                          value: isTosAccepted,
                          onTap: () => {
                            setState(() {
                              isTosAccepted = !isTosAccepted;
                            })
                          },
                          labelWidget: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RichText(
                                text: TextSpan(
                                  style: regularTextStyle(fontSize: 12),
                                  children: [
                                    TextSpan(
                                        text:
                                            '${AppLocalizations.of(context)!.iAgreeToThe} '),
                                    TextSpan(
                                      text: AppLocalizations.of(context)!
                                          .termsConditions,
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {},
                                      style: const TextStyle(
                                          color: AppColors.primary,
                                          decoration: TextDecoration.underline),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const VerticalSpace(height: 24),
                  AppButton(
                    margin: EdgeInsets.symmetric(horizontal: 20.w),
                    title: AppLocalizations.of(context)!.signUp,
                    // enable: isTosAccepted,
                    showLoader: loading,
                    onTap: () async {
                      if (isFormValidate()) {
                        loading = true;
                        setState(() {});
                        await Future.delayed(const Duration(seconds: 2));
                        loading = false;
                        setState(() {});
                        pushAndRemoveAllRoutesName(RoutesNames.onBoarding2);
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
                  const VerticalSpace(height: 12),
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
    bool isNotAgreeTOC = !isTosAccepted &&
        referralCodeFormKey.currentState!.validate() &&
        userNameFormKey.currentState!.validate() &&
        emailFormKey.currentState!.validate() &&
        passwordFormKey.currentState!.validate() &&
        confirmPasswordFormKey.currentState!.validate();

    if (!referralCodeFormKey.currentState!.validate()) {
      isValidate = false;
    }
    if (!userNameFormKey.currentState!.validate()) {
      isValidate = false;
    }
    if (!emailFormKey.currentState!.validate()) {
      isValidate = false;
    }
    if (!passwordFormKey.currentState!.validate() ||
        passwordController.text.length < 8) {
      isValidate = false;
    }
    if (!confirmPasswordFormKey.currentState!.validate()) {
      isValidate = false;
    }
    if (isNotAgreeTOC) {
      AppLocalizations.of(context)!.agreeTOC.showToast();
      isValidate = false;
    }

    return isValidate;
  }
}
