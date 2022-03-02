import 'package:flutter/material.dart';
import 'package:mobile_meal_advisor/theme.dart';

class BufferPage extends StatelessWidget {
  const BufferPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Palette.primary,
      body: SafeArea(
        child: Center(
          child: Image(
            image: AssetImage("assets/gifs/construction.gif"),
          ),
        ),
      ),
    );
  }
}
