import 'package:flutter/material.dart';

class LogoClass extends StatelessWidget {
  const LogoClass({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        'assets/images/logo(2).png', // Path to your image in assets
        width: 179.96, // Set width as needed
        height: 51, // Set height as needed
        fit: BoxFit.fill, // Adjust fit as needed
      ),
    );
  }
}
