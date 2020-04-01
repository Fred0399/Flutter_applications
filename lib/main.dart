import 'package:flutter/material.dart';
import 'package:travel_app/services/repository.dart';
import './screens/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final PlayerRepository _playerRepository = PlayerRepository();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bloc Implementation',
      home: HomePage(playerRepository: _playerRepository),
    );
  }
}
