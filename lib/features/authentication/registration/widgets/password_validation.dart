import 'package:my_boat/themes/colors.dart';
import 'package:my_boat/themes/styles.dart';
import 'package:my_boat/widgets/horizontal_space.dart';
import 'package:flutter/material.dart';

class PasswordValidationText extends StatelessWidget {
  final String text;
  final bool isValid;
  const PasswordValidationText(
      {super.key, required this.text, required this.isValid});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.check,
          color: isValid ? AppColors.c5BB28C : AppColors.c9CA094,
        ),
        const HorizontalSpace(width: 8),
        Text(
          text,
          style: regularTextStyle(
              fontSize: 12,
              color: isValid ? AppColors.c25272B : AppColors.c636C73),
        ),
      ],
    );
  }
}
