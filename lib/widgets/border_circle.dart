import 'package:my_boat/utils/scalling.dart';
import 'package:flutter/material.dart';

class BorderCircle extends StatelessWidget {
  final double radius;
  final double strock;
  final Color color;
  final Widget child;
  const BorderCircle(
      {super.key,
      required this.radius,
      required this.strock,
      required this.color,
      required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: radius.h,
      width: radius.w,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: color, width: strock),
      ),
      child: Center(child: child),
    );
  }
}
