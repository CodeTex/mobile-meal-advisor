import 'package:flutter/material.dart';
import 'package:mobile_meal_advisor/theme.dart';

class SettingsTile extends StatelessWidget {
  final Widget widget;
  final String title;

  const SettingsTile({
    Key? key,
    required this.widget,
    required this.title,
  }) : super(key: key);

  String _withColon(String string) {
    return string + ":";
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(bottom: 10),
      color: Palette.primary.withOpacity(.4),
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
              indent: 5,
              endIndent: 5,
              color: Palette.border,
            ),
          ),
          widget
        ],
      ),
    );
  }
}
