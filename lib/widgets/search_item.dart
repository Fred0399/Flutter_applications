import 'package:flutter/material.dart';

const widthPercent = 238 * 100 / 414;
const heightPercent = 29 * 100 / 736;

class SearchItem extends StatelessWidget {
  final String name;
  final int amount;
  final double price;
  final String status;

  const SearchItem({Key key, this.name, this.amount, this.price, this.status});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final width = screenSize.width * widthPercent / 100;
    final height = screenSize.height * heightPercent / 100;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15),
      width: width,
      height: height,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Container(
            width: width * 0.65,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  name,
                  style: TextStyle(
                    fontFamily: 'Arial',
                    fontWeight: FontWeight.w400,
                    fontSize: 13,
                    color: Color.fromRGBO(67, 74, 94, 1.0),
                  ),
                ),
                Text(
                  '$amount results',
                  style: TextStyle(
                    fontFamily: 'Arial',
                    fontWeight: FontWeight.w400,
                    fontSize: 9,
                    color: Color.fromRGBO(172, 178, 195, 1.0),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: width * 0.35,
            height: height,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: <Widget>[
                    Text(
                      '\$ $price',
                      style: TextStyle(
                        fontFamily: 'Arial',
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: Color.fromRGBO(67, 74, 94, 1.0),
                      ),
                    ),
                    Text(
                      status,
                      style: TextStyle(
                        fontFamily: 'Arial',
                        fontWeight: FontWeight.w400,
                        fontSize: 9,
                        color: Color.fromRGBO(172, 178, 195, 1.0),
                      ),
                    ),
                  ],
                ),
                Image.asset(
                  'assets/images/rightarrow.png',
                  width: screenSize.width * 3.5 / 100,
                  height: screenSize.width * 3.5 / 100,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
