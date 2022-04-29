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

  @override
  void initState() {
    super.initState();
    sharedPreferencesInit();
  }

  void sharedPreferencesInit() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    StoreFilterCategories? activeFilters = prefs.getStringList(keyFilterCategories);
    if (activeFilters == null) {
      log("Store for key " + keyFilterCategories + " return 'null'.");
      return;
    }
    setState(() {});
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
                return CheckboxListTile(
                  title: Text(capitalize(category)),
                  value: false,
                  onChanged: (bool? value) => {},
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
