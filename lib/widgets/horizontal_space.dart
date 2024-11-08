import 'package:my_boat/utils/scalling.dart';
import 'package:flutter/material.dart';

class HorizontalSpace extends StatelessWidget {
  final double width;
  const HorizontalSpace({super.key, required this.width});

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: width.w);
  }
}
