import 'package:flutter/material.dart';
import 'package:mobile_meal_advisor/theme.dart';

class ResultFooter extends StatelessWidget {
  const ResultFooter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border.symmetric(
          horizontal: BorderSide(
            color: Palette.borderColor,
            width: .2,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset("assets/images/icons/work-in-progress.png"),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset("assets/images/icons/under-construction.png"),
          ),
        ],
      ),
    );
  }
}
