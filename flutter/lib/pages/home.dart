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
      backgroundColor: Palette.primary,
      body: SafeArea(
        bottom: false,
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              // Specific centered alignment for gray-bowl.jpg
              alignment: Alignment(-0.3, 0),
              fit: BoxFit.fitHeight,
              image: AssetImage("assets/images/login/gray-bowl.jpg"),
              opacity: .4,
            ),
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: Column(
              children: <Widget>[
                const Expanded(flex: 2, child: HomePageTopBar()),
                Expanded(
                  flex: 5,
                  child: Center(
                    child: Text(
                      "MEAL\nADVISOR",
                      style: GoogleFonts.poppins(
                        color: Palette.systemDark,
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                const Expanded(flex: 5, child: HomePageButton()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class HomePageTopBar extends StatelessWidget {
  const HomePageTopBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border.symmetric(
            horizontal: BorderSide(
          color: Palette.border,
          width: 6,
        )),
        color: Palette.primary,
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
          color: Palette.border,
          fontSize: 48,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.center,
      ),
      onLongPress: () {
        _navigateToResults(context);
      },
      onPressed: () async {
        // await Future.delayed(const Duration(milliseconds: 400), () {});
        _navigateToBuffer(context);
        // await Future.delayed(const Duration(seconds: 12), () {});
        // _navigateToResults(context);
      },
      style: ElevatedButton.styleFrom(
        fixedSize: const Size(200, 200),
        shape: const CircleBorder(
            side: BorderSide(
          color: Palette.border,
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
