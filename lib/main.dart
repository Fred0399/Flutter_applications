import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:intent/extra.dart' as android_extra;
// import 'package:url_launcher/url_launcher.dart';
// import 'package:intent/intent.dart' as android_intent;
// import 'package:intent/action.dart' as android_action;
// import 'package:permission_handler/permission_handler.dart';
// import 'package:flt_telephony_info/flt_telephony_info.dart';
// import 'package:flutter_phone_state/flutter_phone_state.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController _phoneNumberOne = TextEditingController();

  static const platform = const MethodChannel('makecall');

  bool makeCall = false;
  double _value = 65;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.deepOrange,
      ),
      home: Scaffold(
        body: Container(
          alignment: Alignment.center,
          width: double.infinity,
          height: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: _phoneNumberOne,
                textAlign: TextAlign.center,
              ),
              RaisedButton(
                child: Text("Start"),
                onPressed: () {
                  makeCall = true;
                  _makePhoneCall(_phoneNumberOne.text.trim());
                },
              ),
              RaisedButton(
                child: Text("Stop"),
                onPressed: () => makeCall = false,
              ),
              SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  activeTrackColor: Colors.red[700],
                  inactiveTrackColor: Colors.red[100],
                  trackShape: RoundedRectSliderTrackShape(),
                  trackHeight: 4.0,
                  thumbShape: RoundSliderThumbShape(enabledThumbRadius: 12.0),
                  thumbColor: Colors.redAccent,
                  overlayColor: Colors.red.withAlpha(32),
                  overlayShape: RoundSliderOverlayShape(overlayRadius: 28.0),
                  tickMarkShape: RoundSliderTickMarkShape(),
                  activeTickMarkColor: Colors.red[700],
                  inactiveTickMarkColor: Colors.red[100],
                  valueIndicatorShape: PaddleSliderValueIndicatorShape(),
                  valueIndicatorColor: Colors.redAccent,
                  valueIndicatorTextStyle: TextStyle(
                    color: Colors.white,
                  ),
                ),
                child: Slider(
                  value: _value,
                  min: 15,
                  max: 120,
                  divisions: 5,
                  label: '$_value',
                  onChanged: (value) {
                    setState(
                      () {
                        _value = value;
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      routes: {},
    );
  }

  Future<void> _makePhoneCall(String number) async {

      try {
        await platform.invokeMethod('getPhoneCall');
      } on PlatformException catch (e) {
        print("Failed to get battery level: '${e.message}'.");
      }

  }

  // Future<void> _makePhoneCall(String url) async {
  //   if (!makeCall) {
  //     return;
  //   }

  //   await Permission.phone.request();
  //   // var info = await FltTelephonyInfo.info;

  //   if (url.length <= 0) return;

  //   // android_intent.Intent()
  //   //   ..setAction(android_action.Action.ACTION_CALL)
  //   //   ..setData(Uri.parse("tel:$url"))
  //   //   ..startActivity()
  //   //       .catchError((e) => print("ERROR $e"));
  //   android_intent.Intent()
  //     ..setAction(android_action.Action.ACTION_CALL)
  //     ..setData(Uri(scheme: "tel", path: url))
  //     ..startActivity().catchError((e) => print(e));
  //   print("DURATION ${_value.toInt()}");
  //   Future.delayed(Duration(seconds: _value.toInt())).then((value) {
  //     // if (FlutterPhoneState.activeCalls.length <= 0) {
  //       _makePhoneCall(url);
  //     // }
  //   });
  // }
}
