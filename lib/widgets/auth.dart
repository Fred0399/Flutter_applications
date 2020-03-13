import 'package:flutter/material.dart';

const inputWidthPercent = 76.65;
const inputHeightPercent = 30;
const buttonHeightPercent = 60 * 100 / 736;

class AuthPart extends StatefulWidget {
  @override
  AuthPartState createState() => AuthPartState();
}

class AuthPartState extends State<AuthPart> {
  bool _isLogin = true;

  Widget login(Size screenSize) {
    final _priceFocusNode = FocusNode();
    return Container(
      height: screenSize.height * inputHeightPercent / 100,
      child: Form(
        child: ListView(
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Username',
                focusColor: Theme.of(context).primaryColor,
              ),
              textInputAction: TextInputAction.next,
              onFieldSubmitted: (_) {
                FocusScope.of(context).requestFocus(_priceFocusNode);
              },
              style: TextStyle(
                fontSize: 15,
                fontFamily: 'Arial',
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Password',
                focusColor: Theme.of(context).primaryColor,
              ),
              textInputAction: TextInputAction.send,
              obscureText: true,
              onFieldSubmitted: (_) {
                // FocusScope.of(context).requestFocus(_priceFocusNode);
              },
              style: TextStyle(
                fontSize: 15,
                fontFamily: 'Arial',
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget register(Size screenSize) {
    final _emailFocusNode = FocusNode();
    final _passFocusNode = FocusNode();
    final _confPassFocusNode = FocusNode();

    return Container(
      height: screenSize.height * inputHeightPercent * 1.5 / 100,
      child: Form(
        child: ListView(
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Fullname',
                focusColor: Theme.of(context).primaryColor,
              ),
              textInputAction: TextInputAction.next,
              onFieldSubmitted: (_) {
                FocusScope.of(context).requestFocus(_emailFocusNode);
              },
              style: TextStyle(
                fontSize: 15,
                fontFamily: 'Arial',
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Email',
                focusColor: Theme.of(context).primaryColor,
              ),
              textInputAction: TextInputAction.next,
              onFieldSubmitted: (_) {
                FocusScope.of(context).requestFocus(_passFocusNode);
              },
              style: TextStyle(
                fontSize: 15,
                fontFamily: 'Arial',
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Password',
                focusColor: Theme.of(context).primaryColor,
              ),
              textInputAction: TextInputAction.next,
              obscureText: true,
              onFieldSubmitted: (_) {
                FocusScope.of(context).requestFocus(_confPassFocusNode);
              },
              style: TextStyle(
                fontSize: 15,
                fontFamily: 'Arial',
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Confirm Password',
                focusColor: Theme.of(context).primaryColor,
              ),
              textInputAction: TextInputAction.send,
              onFieldSubmitted: (_) {
                // FocusScope.of(context).requestFocus(_priceFocusNode);
              },
              obscureText: true,
              style: TextStyle(
                fontSize: 15,
                fontFamily: 'Arial',
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Container(
      width: screenSize.width * inputWidthPercent / 100,
      child: Column(
        children: [
          (_isLogin) ? (login(screenSize)) : register(screenSize),
          Container(
            height: screenSize.height * 16 / 100,
            width: screenSize.width * inputWidthPercent / 100,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  width: screenSize.width * inputWidthPercent / 100,
                  height: screenSize.height * buttonHeightPercent / 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(86),
                    gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [
                        Color.fromARGB(255, 74, 226, 195),
                        Color.fromARGB(255, 40, 117, 149),
                      ],
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromRGBO(129, 59, 219, 0.5),
                        spreadRadius: 0.5,
                        blurRadius: 10,
                        offset: Offset(0, 4), // changes position of shadow
                      ),
                    ],
                  ),
                  child: FlatButton(
                    onPressed: () {
                      setState(() {
                        // _isLogin = !_isLogin;
                      });
                    },
                    child: Text(
                      (_isLogin) ? 'SIGN IN' : 'SIGN UP',
                      style: TextStyle(
                        fontFamily: 'ArialRoundedMT',
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
                FlatButton(
                  onPressed: () {
                    setState(() {
                      _isLogin = !_isLogin;
                    });
                  },
                  child: Text(
                    (!_isLogin) ? 'SIGN IN' : 'SIGN UP',
                    style: TextStyle(
                      fontFamily: 'ArialRoundedMT',
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(54, 162, 168, 1),
                      fontSize: 15,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
