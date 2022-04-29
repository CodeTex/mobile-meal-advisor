import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_meal_advisor/functions/string.dart';
import 'package:mobile_meal_advisor/screens/settings.dart';
import 'package:mobile_meal_advisor/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: must_be_immutable
class HomePageMenu extends StatefulWidget {
  final VoidCallback onLogoutPressed;
  String? userName;

  HomePageMenu({
    Key? key,
    required this.onLogoutPressed,
    required this.userName,
  }) : super(key: key);

  @override
  State<HomePageMenu> createState() => _HomePageMenuState();
}

class _HomePageMenuState extends State<HomePageMenu> {
  @override
  void initState() {
    super.initState();
  }

  void _updateUsername() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    widget.userName = prefs.getString("username") ?? widget.userName;
    setState(() {
      widget.userName = prefs.getString("username") ?? widget.userName;
    });
  }

  void _navigateToSettings(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) {
        return WillPopScope(
          onWillPop: () async {
            // when coming from settins reload username from shared preferences
            _updateUsername();
            Navigator.pop(context, false);
            return Future.value(false);
          },
          child: const SettingsPage(),
        );
      }),
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
                    onPressed: () => widget.onLogoutPressed(),
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
              greet(widget.userName),
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
