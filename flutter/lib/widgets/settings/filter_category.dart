import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mobile_meal_advisor/constants/meal_map.dart';
import 'package:mobile_meal_advisor/functions/string.dart';
import 'package:mobile_meal_advisor/models/store.dart';
import 'package:mobile_meal_advisor/widgets/settings/tile.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsFilterCategory extends StatefulWidget {
  const SettingsFilterCategory({Key? key}) : super(key: key);

  @override
  State<SettingsFilterCategory> createState() => _SettingsFilterCategoryState();
}

class _SettingsFilterCategoryState extends State<SettingsFilterCategory> {
  final List<String> mealCategories = mealCategoryMap.values.toList();
  StoreFilterCategories _activeCategories = <String>[];

  @override
  void initState() {
    super.initState();
    sharedPreferencesInit();
  }

  void sharedPreferencesInit() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    StoreFilterCategories? activeCategories = prefs.getStringList(keyFilterCategories);
    if (activeCategories == null) {
      log("Store for key " + keyFilterCategories + " return 'null'.");
      return;
    }
    setState(() {
      _activeCategories = activeCategories;
    });
  }

  void _updateSelectedCategories(String category, bool addElement) async {
    StoreFilterCategories activeCategories = _activeCategories;
    if (addElement) {
      activeCategories.add(category);
    } else {
      activeCategories.remove(category);
    }
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList(keyFilterCategories, activeCategories);
    setState(() {
      _activeCategories = activeCategories;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SettingsTile(
      title: "Meal Category Filter",
      body: Container(
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height / 2,
        ),
        child: ListView(
          shrinkWrap: true,
          children: <CheckboxListTile>[
            ...List.generate(
              mealCategoryMap.length,
              (index) {
                String category = mealCategories[index];
                bool isSelected = _activeCategories.contains(category);
                return CheckboxListTile(
                  title: Text(capitalize(category)),
                  value: isSelected,
                  onChanged: (bool? value) => {
                    // default is false
                    value = value ?? false,
                    _updateSelectedCategories(category, value),
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
