import 'package:flutter/material.dart';

class HideKeyboardOnOutsideTap extends StatelessWidget {
  final Widget child;
  const HideKeyboardOnOutsideTap({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
   return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: child,
    );
  }
}
