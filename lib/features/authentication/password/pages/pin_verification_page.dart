import 'package:my_boat/themes/colors.dart';
import 'package:my_boat/themes/styles.dart';
import 'package:my_boat/utils/exports.dart';
import 'package:my_boat/utils/extensions.dart';
import 'package:my_boat/utils/params.dart';
import 'package:my_boat/utils/scalling.dart';
import 'package:my_boat/widgets/app_bar.dart';
import 'package:my_boat/widgets/button.dart';
import 'package:my_boat/widgets/hide_keyboard.dart';
import 'package:my_boat/widgets/pin_input_field.dart';
import 'package:my_boat/widgets/vertical_space.dart';
import 'package:flutter/material.dart';

class PinVerificationPage extends StatefulWidget {
  final PinVerificationPageParams params;
  const PinVerificationPage({super.key, required this.params});

  @override
  State<PinVerificationPage> createState() => _PinVerificationPageState();
}

class _PinVerificationPageState extends State<PinVerificationPage> {
  late final GlobalKey<FormState> otpFormKey;
  late final TextEditingController otpController;

  bool loading = false;

  @override
  void initState() {
    otpFormKey = GlobalKey<FormState>();
    otpController = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    otpController.dispose();
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
                    AppLocalizations.of(context)!.enterCode,
                    style: semiBoldTextStyle(fontSize: 20),
                  ),
                  const VerticalSpace(height: 8),
                  Text(
                    AppLocalizations.of(context)!.weHaveSentYou6DigitCode,
                    style: mediumTextStyle(
                      color: AppColors.c181B23,
                      fontSize: 12,
                    ),
                  ),
                  const VerticalSpace(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Form(
                        key: otpFormKey,
                        child: PinInputField(
                          length: 6,
                          controller: otpController,
                          onSuccess: (value) async {
                            if (isFormValidate()) {}
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return AppLocalizations.of(context)!
                                  .required(AppLocalizations.of(context)!.otp);
                            } else if (value.length < 6) {
                              return '${AppLocalizations.of(context)!.otp} ${AppLocalizations.of(context)!.mustBe6CharactersLong}';
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
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
                margin: EdgeInsets.symmetric(horizontal: 20.w),
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
    if (!otpFormKey.currentState!.validate()) {
      isValidate = false;
    }

    return isValidate;
  }
}
