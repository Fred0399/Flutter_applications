import 'package:flutter/material.dart';

const appBarWidthPercent = 90;
const appBarHeightPercent = 10;
const arrowAppBarWidthPercent = 50 * 100 / 414;
const arrowAppBarHeightPercent = 75 * 100 / 736;

class CustomAppBar extends StatelessWidget {
  final content;
  final Function func;
  CustomAppBar({this.content, this.func});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Container(
      width: screenSize.width * appBarWidthPercent / 100,
      height: screenSize.height * appBarHeightPercent / 100,
      // margin: EdgeInsets.only(top: 70),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            width: screenSize.width * arrowAppBarWidthPercent / 100,
            height: screenSize.height * arrowAppBarHeightPercent / 100,
            child: FittedBox(
              fit: BoxFit.contain,
              child: IconButton(
                icon: Image.asset('assets/images/arrow.png'),
                // iconSize: 100,
                onPressed: func,
              ),
            ),
          ),
          Text(
            content,
            style: TextStyle(
              fontFamily: 'Arial',
              fontSize: 30,
              fontWeight: FontWeight.w400,
              color: Colors.white,
            ),
          ),
          Image.asset('assets/images/profilicon.png'),
        ],
      ),
    );
  }
}
