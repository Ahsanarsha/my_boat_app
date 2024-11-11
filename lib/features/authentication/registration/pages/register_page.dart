import 'package:flutter/material.dart';
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
import 'package:my_boat/widgets/clickable.dart';
import 'package:my_boat/widgets/hide_keyboard.dart';
import 'package:my_boat/widgets/horizontal_space.dart';
import 'package:my_boat/widgets/input_field.dart';
import 'package:my_boat/widgets/logo.dart';
import 'package:my_boat/widgets/sign_up_circular_button.dart';
import 'package:my_boat/widgets/vertical_space.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late final GlobalKey<FormState> fullNameFormKey;
  late final GlobalKey<FormState> emailFormKey;
  late final GlobalKey<FormState> phoneFormKey;
  late final GlobalKey<FormState> countryFormKey;
  late final GlobalKey<FormState> passwordFormKey;
  late final GlobalKey<FormState> confirmPasswordFormKey;

  late final FocusNode fullNameFocus;
  late final FocusNode emailFocus;
  late final FocusNode phoneFocus;
  late final FocusNode countryFocus;
  late final FocusNode passwordFocus;
  late final FocusNode confirmPasswordFocus;

  late final TextEditingController fullNameController;
  late final TextEditingController emailController;
  late final TextEditingController phoneController;
  late final TextEditingController countryController;
  late final TextEditingController passwordController;
  late final TextEditingController confirmPasswordController;

  bool loading = false;
  bool isTosAccepted = false;
  String passwordStrength = '';

  @override
  void initState() {
    fullNameFormKey = GlobalKey<FormState>();
    emailFormKey = GlobalKey<FormState>();
    passwordFormKey = GlobalKey<FormState>();
    phoneFormKey = GlobalKey<FormState>();
    countryFormKey = GlobalKey<FormState>();
    confirmPasswordFormKey = GlobalKey<FormState>();

    fullNameController = TextEditingController();
    emailController = TextEditingController();
    phoneController = TextEditingController();
    countryController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();

    fullNameFocus = FocusNode();
    emailFocus = FocusNode();
    phoneFocus = FocusNode();
    countryFocus = FocusNode();
    passwordFocus = FocusNode();

    confirmPasswordFocus = FocusNode();

    super.initState();
  }

  @override
  void dispose() {
    fullNameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    countryController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();

    fullNameFocus.dispose();
    emailFocus.dispose();
    phoneFocus.dispose();
    countryFocus.dispose();
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const VerticalSpace(height: 32),
                  const LogoClass(),
                  const VerticalSpace(height: 20),
                  Text(
                    AppLocalizations.of(context)!.signUp,
                    style: boldTextStyle(fontSize: 20),
                  ),
                  const VerticalSpace(height: 5),
                  Text(
                    AppLocalizations.of(context)!.welcomeBackSelect,
                    style: mediumTextStyle(fontSize: 12),
                  ),

                  ///UserName Field...
                  ...[
                    const VerticalSpace(height: 16),
                    Row(
                      children: [
                        Text(
                          AppLocalizations.of(context)!.fullName,
                          style: regularTextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                    const VerticalSpace(height: 4),
                    Form(
                      key: fullNameFormKey,
                      child: AppInputField(
                        controller: fullNameController,
                        focusNode: fullNameFocus,
                        name: AppLocalizations.of(context)!.fullName,
                        hint: AppLocalizations.of(context)!.enterFullName,
                        textInputType: TextInputType.name,
                        onChanged: (value) {
                          fullNameFormKey.currentState!.validate();
                        },
                        onFieldSubmitted: (value) {
                          fullNameFormKey.currentState!.validate();
                        },
                      ),
                    ),
                  ],

                  ///Email Field...
                  ...[
                    const VerticalSpace(height: 30),
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

                  ///Phone Field...
                  ...[
                    const VerticalSpace(height: 30),
                    Row(
                      children: [
                        Text(
                          AppLocalizations.of(context)!.phone,
                          style: regularTextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                    const VerticalSpace(height: 4),
                    Form(
                      key: phoneFormKey,
                      child: AppInputField(
                        controller: phoneController,
                        focusNode: phoneFocus,
                        name: AppLocalizations.of(context)!.phone,
                        hint: AppLocalizations.of(context)!.enterPhone,
                        textInputType: TextInputType.phone,
                        onChanged: (value) {
                          phoneFormKey.currentState!.validate();
                        },
                        onFieldSubmitted: (value) {
                          phoneFormKey.currentState!.validate();
                        },
                      ),
                    ),
                  ],

                  ///Country Field...
                  ...[
                    const VerticalSpace(height: 30),
                    Row(
                      children: [
                        Text(
                          AppLocalizations.of(context)!.country,
                          style: regularTextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                    const VerticalSpace(height: 4),
                    Form(
                      key: countryFormKey,
                      child: AppInputField(
                        suffixIcon:
                            const Icon(Icons.keyboard_arrow_down, size: 25),
                        controller: countryController,
                        focusNode: countryFocus,
                        name: AppLocalizations.of(context)!.country,
                        hint: AppLocalizations.of(context)!.selectCounterHere,
                        textInputType: TextInputType.phone,
                        onChanged: (value) {
                          countryFormKey.currentState!.validate();
                        },
                        onFieldSubmitted: (value) {
                          countryFormKey.currentState!.validate();
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
                        name: AppLocalizations.of(context)!.password,
                        hint: AppLocalizations.of(context)!.enterPasswordHere,
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
                    const VerticalSpace(height: 30),
                    Row(
                      children: [
                        Text(
                          AppLocalizations.of(context)!.confirmPassword,
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
                        hint: AppLocalizations.of(context)!.enterPasswordHere,
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

                  const VerticalSpace(height: 30),
                  AppButton(
                    isUpperCase: false,
                    radius: 10,
                    backgroundColor: AppColors.c5CE1E6,

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
                  const VerticalSpace(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.doYouHaveAn,
                        style: regularTextStyle(fontSize: 15),
                      ),
                      Clickable(
                        onTap: () => pushToName(RoutesNames.login),
                        child: RichText(
                          text: TextSpan(
                            style: regularTextStyle(fontSize: 15),
                            children: [
                              TextSpan(
                                  text:
                                      ' ${AppLocalizations.of(context)!.signIn} ',
                                  style: regularTextStyle(
                                    color: AppColors.c5CE1E6,
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
                  const VerticalSpace(height: 20),
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
        fullNameFormKey.currentState!.validate() &&
        emailFormKey.currentState!.validate() &&
        passwordFormKey.currentState!.validate() &&
        confirmPasswordFormKey.currentState!.validate();

    if (!fullNameFormKey.currentState!.validate()) {
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
