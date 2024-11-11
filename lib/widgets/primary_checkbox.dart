import 'package:my_boat/themes/colors.dart';
import 'package:my_boat/widgets/clickable.dart';
import 'package:flutter/material.dart';

class PrimaryCheckBox extends StatelessWidget {
  final String? label;
  final Color activeColor;
  final Color inActiveColor;
  final VoidCallback? onTap;
  final bool value;
  final double space;
  final Widget? labelWidget;
  final TextStyle labelTextStyle;
  final CrossAxisAlignment crossAxisAlignment;
  const PrimaryCheckBox({
    super.key,
    this.label,
    this.activeColor = AppColors.c5CE1E6,
    this.inActiveColor = AppColors.c757575,
    this.onTap,
    this.value = false,
    this.labelTextStyle = const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
    ),
    this.labelWidget,
    this.space = 10,
    this.crossAxisAlignment = CrossAxisAlignment.start,
  });

  @override
  Widget build(BuildContext context) {
    return Clickable(
      onTap: onTap,
      child: Row(
        crossAxisAlignment: crossAxisAlignment,
        children: [
          Container(
            height: 21,
            width: 21,
            decoration: BoxDecoration(
              color: value ? activeColor : Colors.transparent,
              borderRadius: const BorderRadius.all(Radius.circular(4)),
              border: Border.all(
                width: 2,
                color: value ? activeColor : inActiveColor,
              ),
            ),
            child: value
                ? const Icon(
                    Icons.check,
                    size: 15,
                    color: AppColors.white,
                  )
                : const SizedBox(),
          ),
          if (label != null || labelWidget != null) SizedBox(width: space),
          if (label != null)
            Expanded(
              child: Text(
                label!,
                style: labelTextStyle,
              ),
            )
          else if (labelWidget != null)
            SizedBox(height: 21, child: labelWidget!)
        ],
      ),
    );
  }
}
