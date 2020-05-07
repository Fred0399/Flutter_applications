import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/authentication_bloc.dart';
import '../bloc/events/authentication_events.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(BlocProvider.of<AuthenticationBloc>(context).userRepository.getToken),
            RaisedButton(
              onPressed: () {
                BlocProvider.of<AuthenticationBloc>(context).add(LoggedOut());
              },
              child: Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}
