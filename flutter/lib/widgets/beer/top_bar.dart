import 'package:flutter/material.dart';
import 'package:mobile_meal_advisor/theme.dart';

class BeerTopBar extends StatelessWidget {
  const BeerTopBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border.symmetric(
          horizontal: BorderSide(
            color: Palette.border,
            width: 6,
          ),
        ),
        color: Palette.secondary,
      ),
      height: 80,
      child: Center(
        child: Row(
          children: const <Widget>[
            Expanded(
              child: Divider(
                color: Palette.border,
                endIndent: 10,
                indent: 20,
                thickness: 2,
              ),
            ),
            Text(
              "Beer Menu",
              style: TextStyle(
                color: Palette.border,
                fontSize: 24,
                fontWeight: FontWeight.bold,
                // overflow: TextOverflow.ellipsis,
              ),
              textAlign: TextAlign.center,
            ),
            Expanded(
              child: Divider(
                color: Palette.border,
                endIndent: 20,
                indent: 10,
                thickness: 2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
