import 'package:flutter/material.dart';

class Clickable extends StatelessWidget {
  final VoidCallback? onTap;
  final Widget child;

  const Clickable({super.key, this.onTap, required this.child});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () async {
        FocusManager.instance.primaryFocus?.unfocus();
        // onTap!();
        if (onTap != null) {
          onTap!();
        }
      },
      child: child,
    );
  }
}
