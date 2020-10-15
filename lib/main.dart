import 'package:flutter/material.dart';
import 'package:flutter_api_calls_with_exceptions_handling/core/config/locator.dart';
import 'package:flutter_api_calls_with_exceptions_handling/ui/movie_screen/movie_screen.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MovieScreen(),
    );
  }
}
