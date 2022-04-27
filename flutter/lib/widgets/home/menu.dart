import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_meal_advisor/theme.dart';

class HomePageMenu extends StatelessWidget {
  final VoidCallback onLogoutPressed;
  final VoidCallback onSettingPressed;
  final String? userName;

  const HomePageMenu({
    Key? key,
    required this.onLogoutPressed,
    required this.onSettingPressed,
    this.userName,
  }) : super(key: key);

  String greet(String? userName) {
    String greeting = "Hello";
    if (userName != null) greeting += ", " + userName;
    return greeting + "!";
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
                    onPressed: () => onSettingPressed(),
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
