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
    begin: .1,
    end: 1,
  ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));
  late final Animation<Offset> _menuOffset = Tween<Offset>(
    begin: Offset.zero,
    end: const Offset(0, -2),
  ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInQuart));

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
    _controller.reverse();
  }

  void _logout() async {
    _controller.forward();
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
            Column(
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: SlideTransition(
                    position: _menuOffset,
                    child: HomePageMenu(
                      onLogoutPressed: _logout,
                      onSettingPressed: _login,
                    ),
                  ),
                ),
                const Expanded(
                  flex: 5,
                  child: Text(""),
                ),
                Expanded(
                  flex: 5,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 140),
                    child: ElevatedButton(
                      child: const Text("Login"),
                      onPressed: _login,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class HomePageMenu extends StatelessWidget {
  final VoidCallback onLogoutPressed;
  final VoidCallback onSettingPressed;

  const HomePageMenu({
    Key? key,
    required this.onLogoutPressed,
    required this.onSettingPressed,
  }) : super(key: key);

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
    );
  }
}
