import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './screens/enter_screen.dart';
import './screens/auth_screen.dart';
import 'providers/bottomAppBar_data.dart';
import 'providers/travel_choices_data.dart';
import 'screens/services.dart';
import './screens/search.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  MaterialColor colorCustom = MaterialColor(0xFF36A2A8, color);
  MaterialColor colorAccentCustom = MaterialColor(0x36A2A8, color);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Node(),
        ),
        ChangeNotifierProvider.value(
          value: AppBarElements(),
        ),
        ChangeNotifierProvider.value(
          value: TravelChoices(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'MyShop',
        theme: ThemeData(
          primarySwatch: colorCustom,
          accentColor: colorAccentCustom,
          fontFamily: 'Arial',
        ),
        home: EnterScreen(),
        routes: {
          AuthScreen.routeName: (ctx) => AuthScreen(),
          Services.routeName: (ctx) => Services(),
          Search.routeName: (ctx) => Search(),
        },
      ),
    );
  }
}

const Map<int, Color> color = {
  50: Color.fromRGBO(54, 162, 168, .1),
  100: Color.fromRGBO(54, 162, 168, .2),
  200: Color.fromRGBO(54, 162, 168, .3),
  300: Color.fromRGBO(54, 162, 168, .4),
  400: Color.fromRGBO(54, 162, 168, .5),
  500: Color.fromRGBO(54, 162, 168, .6),
  600: Color.fromRGBO(54, 162, 168, .7),
  700: Color.fromRGBO(54, 162, 168, .8),
  800: Color.fromRGBO(54, 162, 168, .9),
  900: Color.fromRGBO(54, 162, 168, 1),
};
