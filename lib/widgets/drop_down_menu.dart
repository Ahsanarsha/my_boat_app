import 'package:my_boat/themes/colors.dart';
import 'package:my_boat/themes/styles.dart';
import 'package:flutter/material.dart';

class AppDropDownMenu extends StatelessWidget {
  final void Function(dynamic) onSelected;
  final List<PopupMenuEntry> childrens;
  final Widget child;

  const AppDropDownMenu(
      {super.key,
      required this.onSelected,
      required this.childrens,
      required this.child});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        popupMenuTheme: PopupMenuThemeData(
          color: AppColors.cF8FBF7,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          textStyle: regularTextStyle(),
        ),
      ),
      child: PopupMenuButton(
        position: PopupMenuPosition.under,
        padding: EdgeInsets.zero,
        itemBuilder: (_) => childrens,
        onSelected: onSelected,
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width - 50,
        ),
        offset: const Offset(0, 3),
        child: child,
      ),
    );
  }
}
