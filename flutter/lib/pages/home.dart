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

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  bool _logState = false;
  final Duration animationDuration = const Duration(seconds: 2);

  late final AnimationController _controller = AnimationController(
    duration: animationDuration,
    vsync: this,
  );
  late final Animation<Offset> _topbarAnimation = Tween<Offset>(
    begin: Offset.zero,
    end: const Offset(0, -1),
  ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInQuart));
  late final Animation<double> _titleAnimation = Tween<double>(
    begin: 1,
    end: 0,
  ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));
  late final Animation<double> _backgroundAnimation = Tween<double>(
    begin: .3,
    end: 1,
  ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));
  late final Animation<Offset> _buttonAnimation = Tween<Offset>(
    begin: Offset.zero,
    end: const Offset(0, 2),
  ).animate(CurvedAnimation(parent: _controller, curve: Curves.elasticIn));
  late final Animation<Offset> _inputAnimation = Tween<Offset>(
    begin: const Offset(0, 2),
    end: const Offset(0, .5),
  ).animate(CurvedAnimation(parent: _controller, curve: Curves.elasticIn));

  void _setHomepage(bool loginState) {
    if (loginState) {
      // user is logged in, widgets stay as they are built
    } else {
      // no user is logged in, jump to animation end state
      _controller.forward(from: 1.0);
      // _controller.forward();
    }
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      _logState = false;
    });
    _setHomepage(_logState);
    // _loggedStateHandler(_logState);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.primary,
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Palette.border,
                    width: 6,
                  ),
                ),
              ),
              child: FadeTransition(
                opacity: _backgroundAnimation,
                child: const Image(
                    alignment: Alignment(-0.3, 0),
                    fit: BoxFit.fitHeight,
                    image: AssetImage("assets/images/login/gray-bowl.jpg")),
              ),
            ),
            Column(
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: SlideTransition(
                    position: _topbarAnimation,
                    child: HomePageTopBar(
                      onLogoutPressed: _onLogout,
                    ),
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Center(
                    child: FadeTransition(
                      opacity: _titleAnimation,
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
                ),
                Expanded(
                  flex: 5,
                  child: Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      SlideTransition(
                        position: _buttonAnimation,
                        child: const HomePageButton(),
                      ),
                      SlideTransition(
                        position: _inputAnimation,
                        child: LoginNameInput(
                          onSubmit: _onLogin,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _onLogin(String userName) {
    _controller.reverse();
  }

  void _onLogout() {
    _controller.forward();
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
  final textController = TextEditingController();
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.centerLeft,
            margin: const EdgeInsets.symmetric(vertical: 20),
            child: Text(
              "Please enter your name:",
              style: GoogleFonts.roboto(
                  color: Colors.white70, fontSize: 18, fontWeight: FontWeight.w500),
            ),
          ),
          Theme(
            data: Theme.of(context).copyWith(
              textSelectionTheme: const TextSelectionThemeData(
                selectionColor: Colors.white70,
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
                fillColor: Colors.white70,
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
      ),
    );
  }
}
