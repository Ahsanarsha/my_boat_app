import 'package:flutter/material.dart';
import 'package:my_boat/themes/colors.dart';

class AppLoader extends StatelessWidget {
  const AppLoader({super.key});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        backgroundColor: AppColors.white.withOpacity(.60),
      ),
    );
  }
}
