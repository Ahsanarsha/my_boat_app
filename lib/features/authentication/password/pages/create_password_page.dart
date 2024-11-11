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
import 'package:my_boat/widgets/logo.dart';
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
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const VerticalSpace(height: 32),
                  const LogoClass(),
                  const VerticalSpace(height: 60),
                  Text(
                    AppLocalizations.of(context)!.setNewPassword,
                    style: boldTextStyle(fontSize: 20),
                  ),
                  const VerticalSpace(height: 8),
                  Text(
                    AppLocalizations.of(context)!.enterANewPassword,
                    style: mediumTextStyle(
                      color: AppColors.c181B23,
                      fontSize: 12,
                    ),
                  ),
                  const VerticalSpace(height: 20),

                  ///Password Field
                  ...[
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
                      key: confirmFormKey,
                      child: AppInputField(
                        controller: confirmController,
                        focusNode: confirmFocus,
                        name: AppLocalizations.of(context)!.confirmPassword,
                        hint: AppLocalizations.of(context)!.enterPasswordHere,
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
                  const VerticalSpace(height: 30),

                  AppButton(
                    radius: 10,
                    backgroundColor: AppColors.c5CE1E6,
                    title: AppLocalizations.of(context)!.setNewPassword,
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
    if (!confirmFormKey.currentState!.validate()) {
      isValidate = false;
    }
    if (!passwordFormKey.currentState!.validate()) {
      isValidate = false;
    }

    return isValidate;
  }
}
