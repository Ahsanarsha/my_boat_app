import 'package:my_boat/themes/colors.dart';
import 'package:my_boat/themes/styles.dart';
import 'package:flutter/material.dart';

class RadioListTileTag extends StatelessWidget {
  final String title;
  final String value;
  final String groupValue;
  final ValueChanged<String?> onChanged;

  const RadioListTileTag({
    super.key,
    required this.title,
    required this.value,
    required this.groupValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return RadioListTile<String>(
      title: Text(
        title,
        style: mediumTextStyle(fontSize: 12, color: AppColors.c181B23),
      ),
      value: value,
      groupValue: groupValue,
      onChanged: onChanged,
      activeColor: AppColors.c5BB28C,
      visualDensity: const VisualDensity(
          vertical: -3.0, horizontal: 0), // Extra compact vertical space
      contentPadding: EdgeInsets.zero,
      dense: true,
    );
  }
}
