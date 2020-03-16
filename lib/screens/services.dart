import 'package:flutter/material.dart';
import '../models/section_data.dart';
import '../widgets/service_sections.dart';

const appBarWidthPercent = 90;
const appBarHeightPercent = 10;
const arrowAppBarWidthPercent = 50 * 100 / 414;
const arrowAppBarHeightPercent = 75 * 100 / 736;
const bodyWidthPercent = 339 * 100 / 414;
const bodyHeightPercent = 368 * 100 / 736;

class Services extends StatelessWidget {
  static const routeName = "/services";
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromRGBO(74, 226, 195, 1.0),
              Color.fromRGBO(40, 117, 149, 1.0),
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Container(
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
                        onPressed: () {
                          print("BACK");
                        },
                      ),
                    ),
                  ),
                  Text(
                    'Services',
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
            ),
            Container(
              width: screenSize.width * bodyWidthPercent / 100,
              height: screenSize.height * bodyHeightPercent / 100,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Container(
                    width: screenSize.width * (100 * 100 / 414) / 100,
                    height: screenSize.height * (330 * 100 / 736) / 100,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: SectionList.listLeft
                          .map(
                            (val) => ServiceSections(
                              imageUrl: val.imgUrl,
                              imageContent: val.text,
                              widthPercent: val.widthPercent,
                              heightPercent: val.heighPercent,
                            ),
                          )
                          .toList(),
                    ),
                  ),
                  VerticalDivider(
                    thickness: 2,
                    endIndent: screenSize.height * 5.5 / 100,
                    indent: screenSize.height * 5.5 / 100,
                  ),
                  Container(
                    width: screenSize.width * (100 * 100 / 414) / 100,
                    height: screenSize.height * (330 * 100 / 736) / 100,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: SectionList.listRight
                          .map(
                            (val) => ServiceSections(
                              imageUrl: val.imgUrl,
                              imageContent: val.text,
                              widthPercent: val.widthPercent,
                              heightPercent: val.heighPercent,
                            ),
                          )
                          .toList(),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
                // height: 10,
                )
          ],
        ),
      ),
    );
  }
}
