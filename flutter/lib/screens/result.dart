import 'dart:convert';
import 'dart:math' as math;
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile_meal_advisor/models/store.dart';
import 'package:mobile_meal_advisor/services/meals.dart';
import 'package:mobile_meal_advisor/widgets/meal_category_checkbox.dart';
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

  Future<void> _showFilterDialog(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          contentPadding: const EdgeInsets.symmetric(vertical: 20),
          title: const Text("Apply filters:"),
          children: [],
          // children: _activeCategories.keys
          //     .map(
          //       (category) => MealCategoryCheckbox(
          //         onChanged: _changeCategorySelection,
          //         category: category,
          //         initialValue: _activeCategories[category],
          //       ),
          //     )
          //     .toList(),
        );
      },
    );
  }

  void changeMeal() {
    if (_meals.isNotEmpty) {
      List<Meal> filteredMeals = _meals
          .where((element) => _activeCategories.contains(element.category.toString()))
          .toList();

      int index = math.Random().nextInt(filteredMeals.length);
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
