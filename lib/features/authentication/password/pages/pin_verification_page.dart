import 'package:flutter/material.dart';
import 'package:my_boat/routes/routes_names.dart';
import 'package:my_boat/themes/colors.dart';
import 'package:my_boat/themes/styles.dart';
import 'package:my_boat/utils/exports.dart';
import 'package:my_boat/utils/extensions.dart';
import 'package:my_boat/utils/helper.dart';
import 'package:my_boat/utils/params.dart';
import 'package:my_boat/widgets/button.dart';
import 'package:my_boat/widgets/hide_keyboard.dart';
import 'package:my_boat/widgets/input_field.dart';
import 'package:my_boat/widgets/logo.dart';
import 'package:my_boat/widgets/vertical_space.dart';

class PinVerificationPage extends StatefulWidget {
  final PinVerificationPageParams params;
  const PinVerificationPage({super.key, required this.params});

  @override
  State<PinVerificationPage> createState() => _PinVerificationPageState();
}

class _PinVerificationPageState extends State<PinVerificationPage> {
  late final GlobalKey<FormState> otpFormKey;
  late final FocusNode otpFocus;

  late final TextEditingController otpController;

  bool loading = false;

  @override
  void initState() {
    otpFormKey = GlobalKey<FormState>();
    otpController = TextEditingController();
    otpFocus = FocusNode();

    super.initState();
  }

  @override
  void dispose() {
    otpController.dispose();
    otpFocus.dispose();
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
                  const VerticalSpace(height: 37),
                  Text(
                    AppLocalizations.of(context)!.otp,
                    style: boldTextStyle(fontSize: 20),
                  ),
                  const VerticalSpace(height: 8),
                  Text(
                    AppLocalizations.of(context)!.aCodeWillBe,
                    style: mediumTextStyle(
                      color: AppColors.c181B23,
                      fontSize: 12,
                    ),
                  ),
                  const VerticalSpace(height: 20),

                  ///Email Field
                  ...[
                    const VerticalSpace(height: 20),
                    Row(
                      children: [
                        Text(
                          AppLocalizations.of(context)!.enterOtpCode,
                          style: regularTextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                    const VerticalSpace(height: 4),
                    Form(
                      key: otpFormKey,
                      child: AppInputField(
                        controller: otpController,
                        focusNode: otpFocus,
                        name: AppLocalizations.of(context)!.enterOtpCode,
                        hint: AppLocalizations.of(context)!.enterOtpHere,
                        textInputType: TextInputType.number,
                        textInputAction: TextInputAction.done,
                        onChanged: (value) {
                          otpFormKey.currentState!.validate();
                        },
                        onFieldSubmitted: (value) {
                          otpFormKey.currentState!.validate();
                        },
                      ),
                    ),
                  ],
                  const VerticalSpace(height: 30),

                  AppButton(
                    isUpperCase: false,
                    radius: 10,
                    backgroundColor: AppColors.c5CE1E6,
                    title: AppLocalizations.of(context)!.next,
                    showLoader: loading,
                    onTap: () async {
                      if (isFormValidate()) {
                        loading = true;
                        setState(() {});
                        await Future.delayed(const Duration(milliseconds: 500));
                        loading = false;
                        setState(() {});
                        'Verification Successful'.showToast();
                        if (widget.params.onSuccess != null) {
                          widget.params.onSuccess!();
                        }
                      }
                    },
                  ),
                  const VerticalSpace(height: 20),

                  AppButton(
                    isUpperCase: false,
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
    if (!otpFormKey.currentState!.validate()) {
      isValidate = false;
    }

    return isValidate;
  }
}
