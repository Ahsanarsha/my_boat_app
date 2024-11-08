import 'package:my_boat/utils/asset_icons.dart';
import 'package:my_boat/utils/helper.dart';
import 'package:my_boat/widgets/clickable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppBackButton extends StatelessWidget {
  final VoidCallback? onTap;
  final String? leadingIcon;
  final double leadingPadding;
  const AppBackButton(
      {super.key, this.leadingIcon, this.onTap, this.leadingPadding = 0});

  @override
  Widget build(BuildContext context) {
    return Clickable(
      onTap: onTap ?? () => goBack(),
      child: Padding(
        padding: EdgeInsets.all(leadingPadding),
        child: Image.asset(leadingIcon ?? AssetIcons.backButton, scale: 4),
      ),
    );
  }
}
