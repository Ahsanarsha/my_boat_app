import 'package:my_boat/themes/colors.dart';
import 'package:my_boat/themes/styles.dart';
import 'package:flutter/material.dart';

class CustomFilterChip extends StatelessWidget {
  final String label;
  final VoidCallback? onSelected;
  final bool isSelected;
  final Color bgColor;
  final Color unselectedLabelColor;

  const CustomFilterChip(
      {super.key,
      required this.label,
      this.onSelected,
      this.unselectedLabelColor = Colors.black,
      this.bgColor = AppColors.cF5ECE7,
      this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return FilterChip(
      label: Text(
        label,
        style: mediumTextStyle(
            fontSize: 12,
            color: isSelected ? Colors.white : unselectedLabelColor),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
        side: const BorderSide(color: Colors.transparent),
      ),
      selected: isSelected,
      onSelected: (selected) {
        if (onSelected != null) {
          onSelected!();
        }
      },
      backgroundColor: bgColor,
      selectedColor: AppColors.c5BB28C,
      showCheckmark: false,
      labelPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
    );
  }
}
