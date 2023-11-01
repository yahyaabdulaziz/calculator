import 'package:calculator/calculator/calculator.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        Calculator.routName:(_)=>Calculator(),
      },
      initialRoute: Calculator.routName,
    );
  }
}
