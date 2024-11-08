import 'package:my_boat/themes/styles.dart';
import 'package:flutter/material.dart';
import 'package:my_boat/themes/colors.dart';
import 'package:my_boat/utils/scalling.dart';
import 'package:pinput/pinput.dart';

class PinInputField extends StatelessWidget {
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final void Function(String)? onSuccess;
  final int length;
  const PinInputField(
      {super.key,
      required this.controller,
      this.validator,
      this.onSuccess,
      required this.length});

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 50.w,
      height: 50.w,
      textStyle: regularTextStyle(fontSize: 16, color: AppColors.black),
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border.all(color: AppColors.cEEE4DF, width: 1.5),
        borderRadius: BorderRadius.circular(8),
      ),
    );

    final submittedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: AppColors.c5BB28C),
      color: Colors.transparent,
    );

    final errorPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: AppColors.error),
      color: Colors.transparent,
    );
    return Pinput(
      preFilledWidget: Text('-', style: defaultPinTheme.textStyle),
      length: length,
      defaultPinTheme: defaultPinTheme,
      focusedPinTheme: errorPinTheme,
      submittedPinTheme: submittedPinTheme,
      errorPinTheme: errorPinTheme,
      errorTextStyle: regularTextStyle(fontSize: 12, color: AppColors.error),
      validator: validator,
      pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
      showCursor: true,
      onCompleted: onSuccess,
    );
  }
}
