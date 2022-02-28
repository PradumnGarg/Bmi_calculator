// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:bmi_app/screens/results.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'screens/input_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
          colorScheme: ColorScheme.light(
              primary: Color(0xFF090C22), secondary: Colors.purple),
          scaffoldBackgroundColor: Color(0xFF101427)),
      initialRoute: '/',
      routes: {
        '/': (context) => InputPage(),
        '/results': (context) => Results(),
      },
    );
  }
}
