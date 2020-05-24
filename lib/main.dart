import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import './screens/counter/counter.dart';
import './screens/timer/timer.dart';

// NOTE Public layout
import './screens/public/screen.dart';
import './screens/public/routes.dart';

// NOTE Public layout
import './screens/private/screen.dart';
import './screens/private/routes.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Start the app with the "/" named route. In this case, the app starts
      // on the FirstScreen widget.
      initialRoute: '/timer',
      routes: {
        '/loader': (context) => AppLoader(),
        '/maintenance': (context) => Maintenance(),
        '/counter': (context) => CounterScreen(),
        '/timer': (context) => TimerScreen(),
        // When navigating to the "/" route, build the FirstScreen widget.
        ...publicRoutes(context),
        // When navigating to the "/second" route, build the SecondScreen widget.
        ...privateRoutes(context),
      },
    );
  }
}

class AppLoader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Positioned(
            top: 0,
            bottom: 0,
            child: Image.asset(
              'assets/images/preloader.jpg',
              fit: BoxFit.cover,
              width: size.width,
            )),
        SizedBox(
          width: 50,
          height: 50,
          child: CircularProgressIndicator(
            valueColor: new AlwaysStoppedAnimation<Color>(Colors.white),
            strokeWidth: 5,
          ),
        )
      ],
    );
  }
}

class Maintenance extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Image.asset(
          'assets/images/maintenance.gif',
          fit: BoxFit.fitWidth,
          width: size.width,
        ));
  }
}
