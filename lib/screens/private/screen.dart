
import 'package:flutter/material.dart';

class PrivateScreens extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Start the app with the "/" named route. In this case, the app starts
      // on the FirstScreen widget.
      initialRoute: '/4',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/3': (context) => Text('3'),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/4': (context) => Text('4'),
      },
    );
  }
}
