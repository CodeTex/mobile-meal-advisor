import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_meal_advisor/pages/buffer.dart';
import 'package:mobile_meal_advisor/pages/result.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fitHeight,
            image: AssetImage("assets/images/login/gray-bowl.jpg"),
          ),
        ),
        child: Column(
          children: const <Widget>[
            Expanded(
              child: Center(
                child: Text("Text"),
              ),
            ),
            Expanded(
              child: HomePageButton(),
            ),
          ],
        ),
      ),
    );
  }
}

class HomePageButton extends StatelessWidget {
  const HomePageButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text(
        "GO",
        style: GoogleFonts.roboto(
          color: Colors.black54,
          fontSize: 48,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.center,
      ),
      onLongPress: () {
        _navigateToResults(context);
      },
      onPressed: () async {
        await Future.delayed(const Duration(milliseconds: 400), () {});
        _navigateToBuffer(context);
        await Future.delayed(const Duration(seconds: 12), () {});
        _navigateToResults(context);
      },
      style: ElevatedButton.styleFrom(
        fixedSize: const Size(200, 200),
        shape: const CircleBorder(
            side: BorderSide(
          color: Colors.black54,
          width: 6,
        )),
      ),
    );
  }

  void _navigateToBuffer(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const BufferPage(),
      ),
    );
  }

  void _navigateToResults(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const ResultPage(),
      ),
    );
  }
}
