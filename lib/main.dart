import 'package:flutter/material.dart';
import 'package:practice/calculator_screen.dart';

void main() {
  runApp(CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {CalculatorScreen.routeName: (_) => CalculatorScreen()},
      initialRoute: CalculatorScreen.routeName,
    );
  }
}
