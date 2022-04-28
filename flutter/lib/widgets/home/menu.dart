import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_meal_advisor/constants/greet_list.dart';
import 'package:mobile_meal_advisor/functions/string.dart';
import 'package:mobile_meal_advisor/screens/settings.dart';
import 'package:mobile_meal_advisor/theme.dart';

class HomePageMenu extends StatelessWidget {
  final VoidCallback onLogoutPressed;
  final String? userName;

  const HomePageMenu({
    Key? key,
    required this.onLogoutPressed,
    this.userName,
  }) : super(key: key);

  String greet(String? userName) {
    String greeting = "Hello";
    String lastCharacter = "";
    List<String> greetings = [];
    int hourOfDay = DateTime.now().hour;

    greetings.addAll(greetingsEm);
    greetings.addAll(greetingsQm);
    if (hourOfDay < 11) {
      greetings.add("good morning");
    } else if (hourOfDay < 14) {
      greetings.add("mahlzeit");
    } else if (hourOfDay < 18) {
      greetings.add("good afternoon");
    } else {
      greetings.add("good evening");
    }

    if (greetings.isNotEmpty) {
      int index = Random().nextInt(greetings.length);
      greeting = capitalize(greetings[index]);
      if (greetingsEm.contains(greetings[index])) {
        lastCharacter = "!";
      } else if (greetingsQm.contains(greetings[index])) {
        lastCharacter = "?";
      }
    }
    if (userName != null) greeting += ", " + userName;
    return greeting + lastCharacter;
  }

  void _navigateToSettings(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const SettingsPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border.symmetric(
            horizontal: BorderSide(
          color: Palette.border,
          width: 6,
        )),
        color: Palette.secondary,
      ),
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 9,
            child: Stack(
              children: <Widget>[
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      "assets/images/icons/work-in-progress.png",
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    icon: const Icon(Icons.logout_outlined),
                    onPressed: () => onLogoutPressed(),
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                    icon: const Icon(Icons.settings),
                    onPressed: () => _navigateToSettings(context),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              greet(userName),
              style: GoogleFonts.roboto(
                color: Palette.border,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
