import 'package:flutter/material.dart';

const sectionWidthPercent = 85 * 100 / 414;
const sectionHeightPercent = 110 * 100 / 736;

class ServiceSections extends StatelessWidget {
  final imageUrl;
  final imageContent;
  final widthPercent;
  final heightPercent;

  ServiceSections({
    this.imageUrl,
    this.imageContent,
    this.widthPercent,
    this.heightPercent,
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Container(
      width: screenSize.width * sectionWidthPercent / 100,
      height: screenSize.height * sectionHeightPercent / 100,
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            imageUrl,
            width: widthPercent * screenSize.width / 100,
            height: heightPercent * screenSize.height / 100,
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            imageContent,
            style: TextStyle(
              fontSize: 15,
              color: Color.fromRGBO(147, 146, 148, 1.0),
              fontFamily: 'Arial',
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
