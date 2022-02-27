import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fitHeight,
            image: AssetImage("assets/images/login/gray-bowl.jpg"),
          ),
        ),
        child: SafeArea(
          child: Container(
            // alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border.all(
                width: 2,
                color: Colors.white,
              ),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Column(
              children: <Widget>[
                const Spacer(
                  flex: 7,
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 2,
                        color: Colors.black,
                      ),
                      color: Colors.transparent,
                    ),
                    child: Text(
                      "Login page",
                      style: GoogleFonts.ubuntu(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Column(
                    children: <Widget>[
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: const EdgeInsets.symmetric(vertical: 20),
                        child: Text(
                          "Please enter your name:",
                          style: GoogleFonts.roboto(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      const NameInput()
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class NameInput extends StatefulWidget {
  const NameInput({Key? key}) : super(key: key);

  @override
  _NameInputState createState() => _NameInputState();
}

class _NameInputState extends State<NameInput> {
  final textController = TextEditingController();
  Icon? inputIcon;
  int charLength = 0;

  _onChanged(String value) {
    setState(() {
      charLength = value.length;

      if (charLength == 0) {
        inputIcon = null;
      } else {
        inputIcon = const Icon(
          Icons.favorite,
          color: Colors.black45,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
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
              color: Colors.black45,
              width: 2,
            ),
          ),
          filled: true,
          fillColor: Colors.white70,
          labelStyle: GoogleFonts.ubuntu(
            color: Colors.black54,
          ),
          labelText: "Name",
          suffixIcon: inputIcon, // make clickable
        ),
        maxLength: 25,
        maxLines: 1,
        onChanged: _onChanged,
      ),
    );
  }
}
