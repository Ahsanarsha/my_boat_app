import 'package:my_boat/routes/routes_names.dart';
import 'package:my_boat/themes/colors.dart';
import 'package:my_boat/themes/styles.dart';
import 'package:my_boat/utils/exports.dart';
import 'package:my_boat/utils/helper.dart';
import 'package:my_boat/utils/params.dart';
import 'package:my_boat/utils/scalling.dart';
import 'package:my_boat/widgets/app_bar.dart';
import 'package:my_boat/widgets/button.dart';
import 'package:my_boat/widgets/hide_keyboard.dart';
import 'package:my_boat/widgets/input_field.dart';
import 'package:my_boat/widgets/logo.dart';
import 'package:my_boat/widgets/vertical_space.dart';
import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  late final GlobalKey<FormState> emailFormKey;
  late final FocusNode emailFocus;
  late final TextEditingController emailController;

  bool loading = false;

  @override
  void initState() {
    emailFormKey = GlobalKey<FormState>();
    emailController = TextEditingController();
    emailFocus = FocusNode();

    super.initState();
  }

  @override
  void dispose() {
    emailFocus.dispose();
    emailController.dispose();
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
                    AppLocalizations.of(context)!.forgotPassword,
                    style: boldTextStyle(fontSize: 20),
                  ),
                  const VerticalSpace(height: 5),

                  Text(
                    AppLocalizations.of(context)!.aCodeToResetYour,
                    style: mediumTextStyle(fontSize: 12),
                  ),

                  ///Email Field
                  ...[
                    const VerticalSpace(height: 20),
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
                        textInputAction: TextInputAction.done,
                        onChanged: (value) {
                          emailFormKey.currentState!.validate();
                        },
                        onFieldSubmitted: (value) {
                          emailFormKey.currentState!.validate();
                        },
                      ),
                    ),
                  ],
                  const VerticalSpace(height: 30),

                  AppButton(
                    radius: 10,
                    backgroundColor: AppColors.c5CE1E6,
                    title: AppLocalizations.of(context)!.next,
                    showLoader: loading,
                    onTap: () async {
                      if (isFormValidate()) {
                        loading = true;
                        setState(() {});
                        await Future.delayed(
                            const Duration(milliseconds: 500), () {});
                        loading = false;
                        setState(() {});

                        pushToName(
                          RoutesNames.pinVerification,
                          arguments: PinVerificationPageParams(
                            email: emailController.text,
                            onSuccess: () {
                              pushToAndReplaceName(RoutesNames.createPassword);
                            },
                          ),
                        );
                      }
                    },
                  ),
                  const VerticalSpace(height: 20),

                  AppButton(
                    radius: 10,
                    backgroundColor: AppColors.cE8E8E8,
                    title: AppLocalizations.of(context)!.login,
                    textStyle: regularTextStyle(color: AppColors.black),
                    onTap: () async {
                      pushToAndReplaceName(RoutesNames.login);
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
    if (!emailFormKey.currentState!.validate()) {
      isValidate = false;
    }

    return isValidate;
  }
}
