import 'package:flutter/material.dart';
import 'package:mobile_meal_advisor/theme.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  final Duration animationDuration = const Duration(seconds: 2);

  late final AnimationController _controller = AnimationController(
    duration: animationDuration,
    vsync: this,
  );
  late final Animation<double> _backgroundFade = Tween<double>(
    begin: .3,
    end: 1,
  ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _login() async {
    _controller.forward();
  }

  void _logout() async {
    _controller.reverse();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.primary,
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: <Widget>[
            FadeTransition(
              opacity: _backgroundFade,
              child: const Image(
                  alignment: Alignment(-0.35, 0),
                  fit: BoxFit.fitHeight,
                  height: double.infinity,
                  image: AssetImage("assets/images/login/gray-bowl.jpg")),
            ),
            Container(
              decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: Palette.border,
                    width: 6,
                  ),
                ),
              ),
            ),
            Container(
              alignment: Alignment.bottomCenter,
              margin: const EdgeInsets.only(bottom: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.all(16.0),
                      primary: Colors.white,
                      textStyle: const TextStyle(fontSize: 20),
                    ),
                    onPressed: () {
                      _login();
                    },
                    child: const Text("Login"),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.all(16.0),
                      primary: Colors.white,
                      textStyle: const TextStyle(fontSize: 20),
                    ),
                    onPressed: () {
                      _logout();
                    },
                    child: const Text("Logout"),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
