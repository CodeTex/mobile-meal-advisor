import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_meal_advisor/pages/buffer.dart';
import 'package:mobile_meal_advisor/pages/result.dart';
import 'package:mobile_meal_advisor/theme.dart';

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
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
          child: Column(
            children: <Widget>[
              const Expanded(
                child: Center(
                  child: Text("Text"),
                ),
              ),
              Expanded(
                child: ElevatedButton(
                  child: Text(
                    "Choose my meal",
                    style: GoogleFonts.roboto(
                      color: Colors.black54,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  onPressed: () async {
                    await Future.delayed(const Duration(milliseconds: 400), () {});
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const BufferPage(),
                      ),
                    );
                    await Future.delayed(const Duration(seconds: 12), () {});
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const ResultPage(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(200, 200),
                    shape: const CircleBorder(
                        side: BorderSide(
                      color: Colors.black54,
                      width: 4,
                    )),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
