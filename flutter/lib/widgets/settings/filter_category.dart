import 'package:flutter/material.dart';
import 'package:mobile_meal_advisor/constants/meal_map.dart';
import 'package:mobile_meal_advisor/functions/string.dart';
import 'package:mobile_meal_advisor/widgets/settings/tile.dart';

class SettingsFilterCategory extends StatelessWidget {
  final List<String> mealCategories = mealCategoryMap.values.toList();

  SettingsFilterCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SettingsTile(
      title: "Meal Category Filter",
      body: Container(
        constraints: const BoxConstraints(maxHeight: 415),
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
