import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_app/providers/bottomAppBar_data.dart';
import '../widgets/background_gradient.dart';
import '../widgets/appBar.dart';

const containerHeightPercent = 577 * 100 / 736;
const upperContainerWidth = 325 * 100 / 414;
const upperContainerHeight = 40 * 100 / 736;
const widthPercent = 238 * 100 / 414;
const heightPercent = 29 * 100 / 736;
const bottomAppBarBoxWidthPercent = 55 * 100 / 414;
const bottomAppBarBoxHeightPercent = 56 * 100 / 736;

class SearchInfo extends StatelessWidget {
  static const routeName = '/info';
  double price;

  @override
  Widget build(BuildContext context) {
    final dataProvider = Provider.of<AppBarElements>(context, listen: false);
    final screenSize = MediaQuery.of(context).size;
    final width = screenSize.width * upperContainerWidth / 100;
    final height = screenSize.height * upperContainerHeight / 100;
    price = ModalRoute.of(context).settings.arguments as double;
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BackGroundGradient.gradBox(),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment,
          children: <Widget>[
            SizedBox(
              height: 50,
            ),
            CustomAppBar(
              content: 'Flight info',
              func: () {
                Navigator.of(context).pop();
              },
            ),
            SizedBox(
              height: 27,
            ),
            Container(
              color: Colors.white,
              height: screenSize.height * containerHeightPercent / 100,
              width: double.infinity,
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 20, bottom: 15),
                    // color: Colors.green,
                    width: width,
                    height: height,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: width * 0.70,
                          height: height,
                          alignment: Alignment.centerLeft,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Text(
                                'Total Fare',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontFamily: 'Arial',
                                  fontWeight: FontWeight.w400,
                                  color: Color.fromRGBO(
                                    40,
                                    117,
                                    149,
                                    1.0,
                                  ),
                                ),
                              ),
                              Text(
                                'Including Tax',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: 'Arial',
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: width * 0.30,
                          height: height,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '\$ $price',
                                style: TextStyle(
                                  fontFamily: 'Arial',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 20,
                                  color: Color.fromRGBO(67, 74, 94, 1.0),
                                ),
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
                  ),
                  Divider(
                    thickness: 1.5,
                    indent: screenSize.width * 11 / 100,
                    endIndent: screenSize.width * 11 / 100,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: width,
                    height: height * 1.5,
                    margin: EdgeInsets.only(top: 5, bottom: 10),
                    child: Row(
                      children: <Widget>[
                        Image.asset(
                          'assets/images/wallet.png',
                          // width: width * 0.3,
                          // height: width * 0.3,
                        ),
                        SizedBox(width: 12),
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Partially Refundable Fare',
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                  fontFamily: 'Arial',
                                  color: Color.fromRGBO(67, 74, 94, 1.0),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'View Fare Rules',
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 15,
                                  fontFamily: 'Arial',
                                  color: Color.fromRGBO(61, 186, 178, 1.0),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Divider(
                    thickness: 1.5,
                    indent: screenSize.width * 11 / 100,
                    endIndent: screenSize.width * 11 / 100,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: width,
                    height: height * 1.5,
                    margin: EdgeInsets.only(top: 5, bottom: 10),
                    // color: Colors.red,
                    child: Row(
                      children: <Widget>[
                        Image.asset(
                          'assets/images/shield.png',
                          // width: width * 0.3,
                          // height: width * 0.3,
                        ),
                        SizedBox(width: 12),
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Secure My Trip With Insurance',
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                  fontFamily: 'Arial',
                                  color: Color.fromRGBO(67, 74, 94, 1.0),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'View Terms & Condititions',
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 15,
                                  fontFamily: 'Arial',
                                  color: Color.fromRGBO(130, 80, 239, 1.0),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Spacer(),
                  Container(
                    width: screenSize.width * 80 / 100,
                    margin: EdgeInsets.only(bottom: 8),
                    height:
                        screenSize.height * bottomAppBarBoxHeightPercent / 100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: dataProvider.items.map((val) {
                        Widget widget = SizedBox();
                        if (val.isSelected) {
                          widget = Container(
                            decoration: BackGroundGradient.gradBox(
                              BorderRadius.circular(5),
                            ),
                            width: bottomAppBarBoxWidthPercent *
                                screenSize.width /
                                100,
                            height: bottomAppBarBoxHeightPercent *
                                screenSize.height /
                                100,
                            child: Container(
                              margin: EdgeInsets.all(10),
                              width: screenSize.width * 8 / 100,
                              height: screenSize.width * 8 / 100,
                              child: Image.asset(
                                val.url,
                                color: Colors.white,
                                fit: BoxFit.contain,
                              ),
                            ),
                          );
                        } else {
                          widget = Image.asset(
                            val.url,
                            width: screenSize.width * 8 / 100,
                            height: screenSize.width * 8 / 100,
                            color: Colors.grey,
                          );
                        }
                        return widget;
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
/*

*/
