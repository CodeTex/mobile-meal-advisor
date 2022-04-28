import 'package:flutter/material.dart';
import 'package:mobile_meal_advisor/widgets/settings/tile.dart';

class SettingsUsername extends StatefulWidget {
  const SettingsUsername({Key? key}) : super(key: key);

  @override
  State<SettingsUsername> createState() => _SettingsUsernameState();
}

class _SettingsUsernameState extends State<SettingsUsername> {
  @override
  Widget build(BuildContext context) {
    return SettingsTile(
      title: "Username",
      widget: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            flex: 7,
            child: TextFormField(),
          ),
          const Spacer(flex: 2),
          Expanded(
            flex: 3,
            child: ElevatedButton(
              onPressed: () => {},
              child: const Text("Change"),
            ),
          ),
        ],
      ),
    );
  }
}
