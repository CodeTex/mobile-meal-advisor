import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_meal_advisor/screens/buffer.dart';
import 'package:mobile_meal_advisor/screens/result.dart';
import 'package:mobile_meal_advisor/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: todo
// TODO: separate independent widgets into separate files

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  final Duration animationDuration = const Duration(seconds: 2);
  bool isLoggedIn = false;
  late String? userName;

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
    isLoggedIn = prefs.getBool("isLoggedIn") ?? false;
    userName = prefs.getString("username");
    if (!isLoggedIn) _controller.forward(from: 1.0);
    // call setState to re-render entire page once informatin is fetched
    setState(() {});
  }

  void _performLogin(String name) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("isLoggedIn", true);
    prefs.setString("username", name);
    isLoggedIn = true;
    userName = name;
    _controller.reverse();
    setState(() {});
  }

  void _performLogout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("isLoggedIn", false);
    prefs.remove("username");
    isLoggedIn = false;
    _controller.forward();
    setState(() {});
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
                      onSettingPressed: () => {},
                      userName: userName,
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
                    child: Stack(
                      children: const <Widget>[
                        Center(
                          child: Divider(
                            color: Palette.border,
                            thickness: 6,
                          ),
                        ),
                        HomePageButton()
                      ],
                    ),
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

class HomePageButton extends StatelessWidget {
  const HomePageButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
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

class LoginNameInput extends StatefulWidget {
  final void Function(String) onSubmit;

  const LoginNameInput({
    Key? key,
    required this.onSubmit,
  }) : super(key: key);

  @override
  State<LoginNameInput> createState() => _LoginNameInputState();
}

class _LoginNameInputState extends State<LoginNameInput> {
  final TextEditingController textController = TextEditingController();
  Icon? inputIcon;
  int charLength = 0;

  void _onChanged(String value) {
    setState(() {
      charLength = value.length;

      if (charLength <= 3) {
        inputIcon = null;
      } else {
        inputIcon = const Icon(
          Icons.login_outlined,
          color: Palette.borderColor,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.only(bottom: 20),
          child: Text(
            "Please enter your name:",
            style: GoogleFonts.roboto(
                color: Palette.borderColor, fontSize: 22, fontWeight: FontWeight.w500),
          ),
        ),
        Theme(
          data: Theme.of(context).copyWith(
            textSelectionTheme: const TextSelectionThemeData(
              selectionColor: Colors.white,
            ),
          ),
          child: TextField(
            controller: textController,
            cursorColor: Colors.black26,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Palette.border,
                  width: 3,
                ),
              ),
              filled: true,
              fillColor: Colors.white,
              labelStyle: GoogleFonts.ubuntu(
                color: Palette.border,
              ),
              labelText: "Name",
              suffixIcon: inputIcon, // make clickable
            ),
            // maxLength: 25,
            maxLines: 1,
            onChanged: _onChanged,
            onSubmitted: widget.onSubmit,
          ),
        ),
      ],
    );
  }
}
