import 'package:my_boat/themes/colors.dart';
import 'package:my_boat/widgets/border_circle.dart';
import 'package:my_boat/widgets/clickable.dart';
import 'package:flutter/material.dart';

class SignUpCircularButton extends StatelessWidget {
  final Color borderColor;
  final double radius;
  final String assetPath;
  final VoidCallback? onTap;
  const SignUpCircularButton(
      {super.key,
      this.onTap,
      this.borderColor = AppColors.cEEE4DF,
      this.radius = 39,
      required this.assetPath});

  @override
  Widget build(BuildContext context) {
    return Clickable(
      onTap: onTap,
      child: BorderCircle(
        color: borderColor,
        radius: radius,
        strock: 1,
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Image.asset(assetPath),
        ),
      ),
    );
  }
}
