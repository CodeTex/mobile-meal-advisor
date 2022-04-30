import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile_meal_advisor/constants/meal_map.dart';
import 'package:mobile_meal_advisor/functions/math.dart';
import 'package:mobile_meal_advisor/functions/string.dart';
import 'package:mobile_meal_advisor/models/store.dart';
import 'package:mobile_meal_advisor/services/meals.dart';
import 'package:mobile_meal_advisor/widgets/result/description.dart';
import 'package:mobile_meal_advisor/widgets/result/footer.dart';
import 'package:mobile_meal_advisor/widgets/result/image.dart';
import 'package:mobile_meal_advisor/widgets/result/title.dart';
import 'package:mobile_meal_advisor/widgets/result/top_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({Key? key}) : super(key: key);

  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  final String _mealDataPath = "assets/data/meals.json";
  late List<Meal> _meals = [];
  late Meal _selectedMeal;
  final List<String> mealCategories = mealCategoryMap.values.toList();
  late StoreFilterCategories _activeCategories;

  @override
  void initState() {
    super.initState();
    sharedPreferencesInit();
    _selectedMeal = Meal(name: "", text: "");
    loadMealsFromFile();
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

  Future<void> loadMealsFromFile() async {
    final String response = await rootBundle.loadString(_mealDataPath);
    final data = await json.decode(response);
    setState(() {
      _meals = Meals.fromJson(data).meals;
    });
    changeMeal();
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

  Future<void> _showFilterDialog(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: const EdgeInsets.symmetric(vertical: 20),
          title: const Text("Apply filters:"),
          content: SizedBox(
            child: SingleChildScrollView(
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
          ),
        );
      },
    );
  }

  void changeMeal() {
    if (_meals.isNotEmpty) {
      List<Meal> filteredMeals = _meals.where((element) {
        return _activeCategories
            .contains(mealCategoryMap[element.category.name.toString()]);
      }).toList();

      if (filteredMeals.isEmpty) {
        log("Filter Meals returned an empty list.");
        return;
      }

      int index = randint(0, filteredMeals.length - 1);
      setState(() {
        _selectedMeal = filteredMeals[index];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            ResultTopBar(
              reloadAction: changeMeal,
              filterAction: () {
                _showFilterDialog(context);
              },
            ),
            Expanded(
              flex: 2,
              child: ResultTitle(
                title: _selectedMeal.name,
              ),
            ),
            Expanded(
              flex: 5,
              child: ResultImage(
                fileName: _selectedMeal.imageFileName,
              ),
            ),
            Expanded(
              flex: 4,
              child: ResultDescription(
                text: _selectedMeal.text,
                price: _selectedMeal.price,
                isVegetarian: _selectedMeal.vegetarian,
                isVegan: _selectedMeal.vegan,
              ),
            ),
            const Expanded(
              flex: 1,
              child: ResultFooter(),
            ),
          ],
        ),
      ),
    );
  }
}
