import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_meal_advisor/screens/buffer.dart';
import 'package:mobile_meal_advisor/screens/result.dart';
import 'package:mobile_meal_advisor/theme.dart';

class HomePageButton extends StatelessWidget {
  const HomePageButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      const Center(
        child: Divider(
          color: Palette.border,
          thickness: 6,
        ),
      ),
      Center(
        child: ElevatedButton(
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
            _navigateToBuffer(context);
          },
          style: ElevatedButton.styleFrom(
            fixedSize: const Size(200, 200),
            primary: Palette.secondary,
            shape: const CircleBorder(
                side: BorderSide(
              color: Palette.border,
              width: 6,
            )),
          ),
        ),
      ),
    ]);
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
