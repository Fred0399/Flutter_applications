import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_app/providers/bottomAppBar_data.dart';
import 'package:travel_app/providers/travel_choices_data.dart';
import '../widgets/background_gradient.dart';
import '../widgets/appBar.dart';
import '../widgets/search_item.dart';

const containerHeightPercent = 577 * 100 / 736;
const upperContainerWidth = 323 * 100 / 414;
const upperContainerHeight = 24 * 100 / 736;
const bottomAppBarBoxWidthPercent = 55 * 100 / 414;
const bottomAppBarBoxHeightPercent = 56 * 100 / 736;

class Search extends StatefulWidget {
  static const String routeName = '/search';
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  void initState() {
    Future.delayed(Duration.zero).then((_) {
      final string = ModalRoute.of(context).settings.arguments as String;
      Provider.of<AppBarElements>(context, listen: false).selectElement(string);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final dataProvider = Provider.of<AppBarElements>(context);
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BackGroundGradient.gradBox(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            SizedBox(
              height: 50,
            ),
            CustomAppBar(
              content: 'Search',
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
                    // color: Colors.grey,
                    width: screenSize.width * upperContainerWidth / 100,
                    height: screenSize.height * upperContainerHeight / 100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Image.asset('assets/images/planeup.png'),
                        Text(
                          'BAKU',
                          style: TextStyle(
                            fontFamily: 'Arial',
                            fontWeight: FontWeight.w900,
                            fontSize: 14,
                            color: Color.fromRGBO(40, 117, 149, 1.0),
                          ),
                        ),
                        Image.asset(
                          'assets/images/rightArrowSearch.png',
                          color: Color.fromRGBO(71, 217, 191, 1.0),
                          height: screenSize.height * 2.5 / 100,
                          width: screenSize.width * 4 / 100,
                        ),
                        Text(
                          'ANTALYA',
                          style: TextStyle(
                            fontFamily: 'Arial',
                            fontWeight: FontWeight.w900,
                            fontSize: 14,
                            color: Color.fromRGBO(40, 117, 149, 1.0),
                          ),
                        ),
                        Container(
                          child: Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Image.asset('assets/images/clock.png'),
                              SizedBox(
                                width: 2,
                              ),
                              Container(
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    Text(
                                      '3h, 5m',
                                      style: TextStyle(
                                        fontSize: 8,
                                        fontFamily: 'Arial',
                                        fontWeight: FontWeight.w700,
                                        color: Color.fromRGBO(
                                          40,
                                          117,
                                          149,
                                          1.0,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      '0 stop',
                                      style: TextStyle(
                                        fontSize: 8,
                                        fontFamily: 'Arial',
                                        fontWeight: FontWeight.w700,
                                        color: Color.fromRGBO(
                                          40,
                                          117,
                                          149,
                                          1.0,
                                        ),
                                      ),
                                    ),
                                  ],
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
                    height: screenSize.height * 0.55,
                    child: Consumer<TravelChoices>(builder: (ctx, data, _) {
                      return ListView.builder(
                        itemBuilder: (BuildContext ctx, int index) {
                          return SearchItem(
                            name: data.items[index].name,
                            status: data.items[index].status,
                            price: data.items[index].price,
                            amount: data.items[index].count,
                            func: () {
                              Navigator.of(context).pushNamed('/info',arguments: data.items[index].price);
                            },
                          );
                        },
                        itemCount: data.items.length,
                      );
                    }),
                  ),
                  Container(
                    width: screenSize.width * 80 / 100,
                    margin: EdgeInsets.only(bottom: 15),
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
            )
          ],
        ),
      ),
    );
  }
}
