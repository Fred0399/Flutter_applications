import 'package:flutter/material.dart';

class BackGroundGradient {
  static BoxDecoration gradBox([BorderRadius borderRadius]) {
    return BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color.fromRGBO(74, 226, 195, 1.0),
          Color.fromRGBO(40, 117, 149, 1.0),
        ],
      ),
      borderRadius: borderRadius
    );
  }
}
