import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile_meal_advisor/constants/meal_map.dart';
import 'package:mobile_meal_advisor/functions/math.dart';
import 'package:mobile_meal_advisor/models/store.dart';
import 'package:mobile_meal_advisor/services/meals.dart';
import 'package:mobile_meal_advisor/widgets/result/description.dart';
import 'package:mobile_meal_advisor/widgets/result/filter_dialog.dart';
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
  final List<String> _mealCategories = mealCategoryMap.values.toList();
  late List<Meal> _meals = [];
  late Meal _selectedMeal;
  StoreFilterCategories _selectedCategories = <String>[];

  @override
  void initState() {
    sharedPreferencesInit();
    _selectedMeal = Meal(name: null, text: null);
    loadMealsFromFile();
    super.initState();
  }

  void sharedPreferencesInit() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    StoreFilterCategories? selectedCategories = prefs.getStringList(keyFilterCategories);
    if (selectedCategories == null) {
      log("Store for key " + keyFilterCategories + " return 'null'.");
      return;
    }
    setState(() {
      _selectedCategories = selectedCategories;
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

  void changeMeal() {
    if (_meals.isNotEmpty) {
      List<Meal> filteredMeals = _meals.where((element) {
        return _selectedCategories
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
                showDialog(
                    context: context,
                    builder: (context) {
                      return FilterCategoryDialog(
                        categories: _mealCategories,
                        selectedCategories: _selectedCategories,
                        onSelectedCategoryChanged: (List<String> categories) {
                          _selectedCategories = categories;
                        },
                      );
                    });
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
