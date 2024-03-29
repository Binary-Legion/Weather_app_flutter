import 'package:flutter/material.dart';
import 'package:weather_app/screens/loading_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: LoadingScreen(),
      theme: ThemeData.light(),
    );
  }
}
