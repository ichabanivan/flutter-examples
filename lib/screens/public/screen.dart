
import 'package:flutter/material.dart';

class PublicScreens extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text('Hi');
    return MaterialApp(
      // Start the app with the "/" named route. In this case, the app starts
      // on the FirstScreen widget.
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/1': (context) => Text('1'),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/2': (context) => Text('2'),
      },
    );
  }
}
