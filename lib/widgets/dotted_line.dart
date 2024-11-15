import 'package:dotted_line/dotted_line.dart';
import 'package:my_boat/themes/colors.dart';
import 'package:flutter/material.dart';

class AppDottedLine extends StatelessWidget {
  const AppDottedLine({super.key});

  @override
  Widget build(BuildContext context) {
    return DottedLine(
      direction: Axis.horizontal,
      alignment: WrapAlignment.center,
      lineLength: double.infinity,
      lineThickness: 1.0,
      dashLength: 4.0,
      dashColor: AppColors.c3C3C43.withOpacity(.6),
      dashRadius: 0.0,
      dashGapLength: 4.0,
      dashGapColor: Colors.transparent,
      dashGapRadius: 0.0,
    );
  }
}
