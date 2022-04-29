import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mobile_meal_advisor/models/store.dart';
import 'package:mobile_meal_advisor/widgets/settings/tile.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsUsername extends StatefulWidget {
  const SettingsUsername({Key? key}) : super(key: key);

  @override
  State<SettingsUsername> createState() => _SettingsUsernameState();
}

class _SettingsUsernameState extends State<SettingsUsername> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    sharedPreferencesInit();
  }

  void sharedPreferencesInit() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    StoreUserName? userName = prefs.getString("username");
    if (userName == null) {
      log("Store for key 'username' return 'null'.");
      return;
    }
    _controller.text = userName;
    setState(() {});
  }

  void _changeUsername(String name) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("username", name);
  }

  @override
  Widget build(BuildContext context) {
    return SettingsTile(
      title: "Username",
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            flex: 7,
            child: TextFormField(
              controller: _controller,
            ),
          ),
          const Spacer(flex: 2),
          Expanded(
            flex: 3,
            child: ElevatedButton(
              onPressed: () => {_changeUsername(_controller.text)},
              child: const Text("Change"),
            ),
          ),
        ],
      ),
    );
  }
}
