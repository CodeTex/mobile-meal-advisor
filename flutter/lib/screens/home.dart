import 'package:flutter/material.dart';
import 'package:mobile_meal_advisor/theme.dart';
import 'package:mobile_meal_advisor/models/store.dart';
import 'package:mobile_meal_advisor/widgets/home/button.dart';
import 'package:mobile_meal_advisor/widgets/home/menu.dart';
import 'package:mobile_meal_advisor/widgets/home/name_input.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  final Duration animationDuration = const Duration(seconds: 2);
  StoreLogState _isLoggedIn = false;
  StoreUserName? _userName;

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
  late final Animation<Offset> _buttonOffset = Tween<Offset>(
    begin: Offset.zero,
    end: const Offset(0, 2),
  ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInQuart));
  late final Animation<Offset> _userNameOffset = Tween<Offset>(
    begin: const Offset(0, 2),
    end: const Offset(0, .3),
  ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInQuart));

  @override
  void initState() {
    super.initState();
    sharedPreferencesInit();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void sharedPreferencesInit() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _isLoggedIn = prefs.getBool(keyLogState) ?? false;
    _userName = prefs.getString(keyUserName) ?? _userName;
    if (!_isLoggedIn) _controller.forward(from: 1.0);
    // call setState to re-render entire page once informatin is fetched
    setState(() {});
  }

  void _performLogin(String name) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(keyLogState, true);
    prefs.setString(keyUserName, name);
    setState(() {
      _isLoggedIn = true;
      _userName = name;
      _controller.reverse();
    });
  }

  void _performLogout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(keyLogState, false);
    prefs.remove(keyUserName);
    setState(() {
      _isLoggedIn = false;
      _userName = "";
      _controller.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.primary,
      resizeToAvoidBottomInset: false,
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
                      onLogoutPressed: _performLogout,
                      userName: _userName,
                    ),
                  ),
                ),
                const Expanded(
                  flex: 5,
                  child: Text(""),
                ),
                Expanded(
                  flex: 5,
                  child: SlideTransition(
                    position: _buttonOffset,
                    child: const HomePageButton(),
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: MediaQuery.of(context).viewInsets.bottom + 80,
              left: 40,
              right: 40,
              child: SlideTransition(
                position: _userNameOffset,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(4)),
                    color: Colors.white.withOpacity(.6),
                  ),
                  padding: const EdgeInsets.all(10),
                  child: LoginNameInput(onSubmit: _performLogin),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
