import 'package:flutter/material.dart';
import 'package:mobile_meal_advisor/theme.dart';

class SettingsTile extends StatelessWidget {
  final String title;
  final Widget body;

  const SettingsTile({
    Key? key,
    required this.title,
    required this.body,
  }) : super(key: key);

  String _withColon(String string) {
    return string + ":";
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(bottom: 10),
      color: Palette.primary.withOpacity(.4),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          children: <Widget>[
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                _withColon(title),
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: Divider(
                height: 2,
                color: Palette.border,
              ),
            ),
            body
          ],
        ),
      ),
    );
  }
}
