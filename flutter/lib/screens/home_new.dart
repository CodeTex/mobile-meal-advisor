import 'package:flutter/material.dart';
import 'package:mobile_meal_advisor/theme.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final decorationFrame = const BoxDecoration(
    border: Border(
      top: BorderSide(
        color: Palette.border,
        width: 6,
      ),
    ),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.primary,
      body: SafeArea(
        bottom: false,
        child: Container(
          decoration: decorationFrame,
        ),
      ),
    );
  }
}
