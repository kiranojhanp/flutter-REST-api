import 'package:flutter/material.dart';
import 'package:rest_api_test/screens/loading_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      title: 'Weather app',
      home: LoadingScreen(),
    );
  }
}