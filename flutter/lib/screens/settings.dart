import 'package:flutter/material.dart';
import 'package:mobile_meal_advisor/theme.dart';
import 'package:mobile_meal_advisor/widgets/settings/tile.dart';

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
          children: const <SettingsTile>[
            SettingsTile(title: "Title", widget: Text("Test 1")),
            SettingsTile(title: "Title", widget: Text("Test 2")),
            SettingsTile(title: "Title", widget: Text("Test 3")),
            SettingsTile(title: "Title", widget: Text("Test 4")),
            SettingsTile(title: "Title", widget: Text("Test 5")),
            SettingsTile(title: "Title", widget: Text("Test 6")),
            SettingsTile(title: "Title", widget: Text("Test 7")),
          ],
        ),
      ),
    );
  }
}
