import 'package:flutter/material.dart';
import 'package:mobile_meal_advisor/theme.dart';
import 'package:mobile_meal_advisor/widgets/settings/filter_category.dart';
import 'package:mobile_meal_advisor/widgets/settings/user.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      backgroundColor: Palette.primary.withOpacity(.8),
      body: SafeArea(
        bottom: false,
        child: ListView(
          padding: const EdgeInsets.all(10),
          children: const <Widget>[
            SettingsUsername(),
            SettingsFilterCategory(),
          ],
        ),
      ),
    );
  }
}
