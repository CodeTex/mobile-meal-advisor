import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_meal_advisor/theme.dart';

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
