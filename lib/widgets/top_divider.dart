import 'package:my_boat/themes/colors.dart';
import 'package:my_boat/utils/scalling.dart';
import 'package:my_boat/widgets/vertical_space.dart';
import 'package:flutter/material.dart';

class CompanyDivider extends StatelessWidget {
  final bool isTopDivider;
  const CompanyDivider({super.key, this.isTopDivider = true});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        VerticalSpace(height: isTopDivider ? 3.h : 16.h),
        Divider(color: AppColors.cEDE6DB, height: 2.h),
        VerticalSpace(height: isTopDivider ? 16.h : 3.h),
      ],
    );
  }
}
