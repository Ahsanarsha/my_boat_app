import 'package:badges/badges.dart' as badges;
import 'package:my_boat/themes/colors.dart';
import 'package:my_boat/themes/styles.dart';
import 'package:my_boat/utils/scalling.dart';
import 'package:flutter/material.dart';

class BadgeWidget extends StatelessWidget {
  final String icon;
  final double scaling;
  final badges.BadgePosition? position;
  const BadgeWidget(
      {super.key, required this.icon, this.scaling = 4, this.position});

  @override
  Widget build(BuildContext context) {
    return badges.Badge(
      position: position,
      badgeContent: Text(
        '10',
        style: mediumTextStyle(fontSize: 12, color: AppColors.white),
      ),
      badgeAnimation: const badges.BadgeAnimation.slide(
        animationDuration: Duration(seconds: 1),
        curve: Curves.fastOutSlowIn,
      ),
      badgeStyle: const badges.BadgeStyle(
        padding: EdgeInsets.all(3),
        elevation: 2,
      ),
      child: SizedBox(
        height: 35.h,
        child: Image.asset(icon, scale: scaling),
      ),
    );
  }
}
