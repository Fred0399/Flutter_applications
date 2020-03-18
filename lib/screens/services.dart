import 'package:flutter/material.dart';
import '../models/section_data.dart';
import '../widgets/service_sections.dart';
import '../widgets/appBar.dart';
import '../widgets/background_gradient.dart';
import 'package:provider/provider.dart';
import '../providers/bottomAppBar_data.dart';

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
          decoration: BackGroundGradient.gradBox(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              CustomAppBar(
                content: 'Services',
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
                                execFunc: () {
                                  Navigator.of(context).pushNamed('/search');
                                },
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
