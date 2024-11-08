import 'package:my_boat/features/authentication/registration/widgets/password_validation.dart';
import 'package:my_boat/routes/routes_names.dart';
import 'package:my_boat/themes/colors.dart';
import 'package:my_boat/themes/styles.dart';
import 'package:my_boat/utils/exports.dart';
import 'package:my_boat/utils/extensions.dart';
import 'package:my_boat/utils/helper.dart';
import 'package:my_boat/utils/regexs.dart';
import 'package:my_boat/utils/scalling.dart';
import 'package:my_boat/widgets/app_bar.dart';
import 'package:my_boat/widgets/button.dart';
import 'package:my_boat/widgets/hide_keyboard.dart';
import 'package:my_boat/widgets/horizontal_space.dart';
import 'package:my_boat/widgets/input_field.dart';
import 'package:my_boat/widgets/vertical_space.dart';
import 'package:flutter/material.dart';

class CreatePasswordPage extends StatefulWidget {
  const CreatePasswordPage({super.key});

  @override
  State<CreatePasswordPage> createState() => _CreatePasswordPageState();
}

class _CreatePasswordPageState extends State<CreatePasswordPage> {
  late final GlobalKey<FormState> confirmFormKey;
  late final GlobalKey<FormState> passwordFormKey;
  late final FocusNode confirmFocus;
  late final FocusNode passwordFocus;
  late final TextEditingController confirmController;
  late final TextEditingController passwordController;

  bool loading = false;
  String passwordStrength = '';

  @override
  void initState() {
    confirmFormKey = GlobalKey<FormState>();
    passwordFormKey = GlobalKey<FormState>();
    confirmController = TextEditingController();
    passwordController = TextEditingController();
    confirmFocus = FocusNode();
    passwordFocus = FocusNode();

    super.initState();
  }

  @override
  void dispose() {
    confirmFocus.dispose();
    passwordFocus.dispose();
    confirmController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return HideKeyboardOnOutsideTap(
      child: Scaffold(
        appBar:
            CustomAppBar(title: AppLocalizations.of(context)!.forgotPassword),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const VerticalSpace(height: 24),
                  Text(
                    AppLocalizations.of(context)!.enterRegisteredEmail,
                    style: semiBoldTextStyle(fontSize: 20),
                  ),

                  ///Password Field
                  ...[
                    const VerticalSpace(height: 24),
                    Row(
                      children: [
                        Text(
                          '${AppLocalizations.of(context)!.newPassword}*',
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
                        name: AppLocalizations.of(context)!.newPassword,
                        hint: AppLocalizations.of(context)!.enterNewPassword,
                        textInputType: TextInputType.visiblePassword,
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
                    const VerticalSpace(height: 24),
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
                      key: confirmFormKey,
                      child: AppInputField(
                        controller: confirmController,
                        focusNode: confirmFocus,
                        name: AppLocalizations.of(context)!.confirmPassword,
                        hint:
                            AppLocalizations.of(context)!.enterConfirmPassword,
                        textInputType: TextInputType.visiblePassword,
                        isLoginPassword: true,
                        textInputAction: TextInputAction.done,
                        onChanged: (value) {
                          confirmFormKey.currentState!.validate();
                        },
                        onFieldSubmitted: (value) {
                          confirmFormKey.currentState!.validate();
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
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AppButton(
                margin: EdgeInsets.symmetric(horizontal: 24.w),
                title: AppLocalizations.of(context)!.save,
                showLoader: loading,
                onTap: () async {
                  if (isFormValidate()) {
                    var appLoc = AppLocalizations.of(context);
                    loading = true;
                    setState(() {});
                    await Future.delayed(
                        const Duration(milliseconds: 500), () {});
                    loading = false;
                    setState(() {});
                    appLoc!.passwordHasBeenChangeedSuccessfully.showToast();
                    popUntil(RoutesNames.login);
                  }
                },
              ),
              if (!(MediaQuery.of(context).padding.bottom > 0))
                SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }

  bool isFormValidate() {
    bool isValidate = true;
    if (!confirmFormKey.currentState!.validate()) {
      isValidate = false;
    }
    if (!passwordFormKey.currentState!.validate()) {
      isValidate = false;
    }

    return isValidate;
  }
}
