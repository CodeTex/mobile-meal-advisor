import 'package:flutter/material.dart';
import 'package:mobile_meal_advisor/theme.dart';
import 'package:mobile_meal_advisor/widgets/bordered_box.dart';

class ResultTitle extends StatelessWidget {
  final String title;

  const ResultTitle({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
      child: SlimBorderedBox(
        backgroundColor: Theme.of(context).colorScheme.background,
        borderColor: Palette.borderColor,
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(10),
          child: Text(
            title,
            style: const TextStyle(
              color: Palette.borderColor,
              fontSize: 24,
              fontWeight: FontWeight.bold,
              // overflow: TextOverflow.ellipsis,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
