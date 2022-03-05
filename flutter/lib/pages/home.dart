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
  bool _loggedIn = true;
  double _backgroundOpacity = 1;

  void _loadUser(bool loggedIn) {
    if (loggedIn) {
      setState(() {
        _backgroundOpacity = .4;
      });
    } else {
      setState(() {
        _backgroundOpacity = 1;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _loadUser(_loggedIn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.primary,
      body: SafeArea(
        bottom: false,
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              // Specific centered alignment for gray-bowl.jpg
              alignment: const Alignment(-0.3, 0),
              fit: BoxFit.fitHeight,
              image: const AssetImage("assets/images/login/gray-bowl.jpg"),
              opacity: _backgroundOpacity,
            ),
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: Column(
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: HomePageTopBar(
                    onLogoutPressed: () {
                      setState(() {
                        _loggedIn = false;
                      });
                      _loadUser(_loggedIn);
                    },
                  ),
                ),
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

class HomePageTopBar extends StatefulWidget {
  final VoidCallback onLogoutPressed;

  const HomePageTopBar({
    Key? key,
    required this.onLogoutPressed,
  }) : super(key: key);

  @override
  State<HomePageTopBar> createState() => _HomePageTopBarState();
}

class _HomePageTopBarState extends State<HomePageTopBar> {
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
      child: Stack(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset("assets/images/icons/work-in-progress.png"),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: IconButton(
              icon: const Icon(Icons.logout_outlined),
              onPressed: widget.onLogoutPressed,
            ),
          )
        ],
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
        _navigateToBuffer(context);
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
