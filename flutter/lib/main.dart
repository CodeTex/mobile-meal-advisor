import 'package:flutter/material.dart';
import 'package:mobile_meal_advisor/pages/home.dart';
import 'package:mobile_meal_advisor/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mobile Meal Advisor',
      theme: materialAdvisorTheme,
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}
