import 'package:my_boat/widgets/vertical_space.dart';
import 'package:flutter/material.dart';

class DynamicVerticalSpace extends StatelessWidget {
  final double height;
  const DynamicVerticalSpace({super.key, required this.height});

  @override
  Widget build(BuildContext context) {
    return ((MediaQuery.of(context).padding.bottom > 0))
        ? VerticalSpace(height: height)
        : const SizedBox();
  }
}
