import 'package:flutter/material.dart';
import 'package:travel_app/widgets/auth.dart';
import '../widgets/logo.dart';

class AuthScreen extends StatelessWidget {
  static const routeName = "AuthScreen";
  int _authType; //0 means login 1 means register to open

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    _authType = ModalRoute.of(context).settings.arguments as int;
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: <Widget>[
            Container(
              width: screenSize.width * 34.78 / 100,
              height: screenSize.height * 24.32 / 100,
              margin: EdgeInsets.only(top: 90),
              child: Logo(
                logoColor: Color.fromARGB(255, 58, 173, 173),
              ),
            ),
            AuthPart(
              authLogin: (_authType == 0) ? true : false,
            ),
          ],
        ),
      ),
    );
  }
}
