import 'package:flutter/material.dart';

class LoadingIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white,
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
}
