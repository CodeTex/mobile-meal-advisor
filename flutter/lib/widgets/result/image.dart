import 'package:flutter/material.dart';
import 'package:mobile_meal_advisor/theme.dart';

class ResultImage extends StatelessWidget {
  final String fileName;

  const ResultImage({
    Key? key,
    required this.fileName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          border: const Border.symmetric(
            horizontal: BorderSide(
              color: Palette.borderColor,
              width: 2,
            ),
          ),
          color: Theme.of(context).colorScheme.background,
        ),
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fitHeight,
              image: AssetImage("assets/images/" + fileName),
            ),
          ),
          // child: Image.asset("assets/images/" + fileName),
        ));
  }
}
