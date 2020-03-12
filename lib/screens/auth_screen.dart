import 'package:flutter/material.dart';
import '../widgets/logo.dart';

class AuthScreen extends StatelessWidget {
  Widget buttons({Size screenSize, Function onPressFunction, String desc}) {
    return Container(
      width: screenSize.width * 57.5 / 100,
      height: screenSize.height * 6.8 / 100,
      decoration: BoxDecoration(
        border: Border.all(width: 3, color: Colors.white),
        borderRadius: BorderRadius.circular(40),
      ),
      child: FlatButton(
        child: Text(
          desc,
          style: TextStyle(
            fontFamily: 'ArialRoundedMT',
            // fontWeight: Fon,
            color: Colors.white,
            fontSize: 15,
          ),
          textAlign: TextAlign.center,
        ),
        onPressed: onPressFunction,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: ExactAssetImage('assets/images/background.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromARGB(255, 74, 226, 195),
                  Color.fromARGB(140, 29, 101, 130),
                ],
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: screenSize.width * 34.78 / 100,
                  height: screenSize.height * 24.32 / 100,
                  margin: EdgeInsets.only(top: 90),
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 3,
                      color: Colors.white,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Logo(),
                ),
                Text(
                  "Your dream travel...",
                  style: TextStyle(
                    fontFamily: 'Arial',
                    color: Colors.white,
                    fontSize: 25,
                    // fontWeight: FontWeight.w600,
                  ),
                ),
                Container(
                  width: screenSize.width * 57.5 / 100,
                  height: screenSize.height * 19 / 100,
                  margin: EdgeInsets.only(bottom: 80,top:20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      buttons(
                        desc: "SIGN IN",
                        screenSize: screenSize,
                        onPressFunction: () {
                          print('Sign In');
                        },
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 5),
                        child: Text(
                          'OR',
                          style: TextStyle(
                            fontFamily: 'Arial',
                            fontWeight: FontWeight.w800,
                            color: Colors.white,
                            fontSize: 12,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      buttons(
                        desc: "CREATE ACCOUNT",
                        screenSize: screenSize,
                        onPressFunction: () {
                          print('Sign UP');
                        },
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
