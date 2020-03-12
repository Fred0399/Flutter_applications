import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  final Color logoColor;
  Logo({this.logoColor = Colors.white});
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Container(
      width: (screenSize.width * 21.5) / 100,
      height: (screenSize.height * 14.72) / 100,
      child: Image.asset(
        "assets/images/logo.png",
        color: logoColor,
      ),
    );
  }
}
