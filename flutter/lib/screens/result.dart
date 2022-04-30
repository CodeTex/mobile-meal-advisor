import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile_meal_advisor/services/meals.dart';
import 'package:mobile_meal_advisor/widgets/meal_category_checkbox.dart';
import 'package:mobile_meal_advisor/widgets/result/description.dart';
import 'package:mobile_meal_advisor/widgets/result/footer.dart';
import 'package:mobile_meal_advisor/widgets/result/image.dart';
import 'package:mobile_meal_advisor/widgets/result/title.dart';
import 'package:mobile_meal_advisor/widgets/result/top_bar.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({Key? key}) : super(key: key);

  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  final String _mealDataPath = "assets/data/meals.json";
  late List<Meal> _meals = [];
  late Meal _selectedMeal;
  late Map<MealCategory, bool?> _selectedCategories;

  @override
  void initState() {
    super.initState();
    _selectedMeal = Meal(name: "", text: "");
    loadMealsFromFile();
    setState(() {
      _selectedCategories = _createCategoryMap();
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

  Map<MealCategory, bool?> _createCategoryMap() {
    Map<MealCategory, bool?> categoryMap = {};
    MealCategory.values.asMap().forEach((index, cat) {
      categoryMap[cat] = true;
    });
    return categoryMap;
  }

  Future<void> _showFilterDialog(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: const Text("Select filters:"),
          children: _selectedCategories.keys
              .map(
                (category) => MealCategoryCheckbox(
                  onChanged: _changeCategorySelection,
                  category: category,
                  initialValue: _selectedCategories[category],
                ),
              )
              .toList(),
        );
      },
    );
  }

  void _changeCategorySelection(MealCategory category, bool? value) {
    setState(() {
      _selectedCategories[category] = value;
    });
  }

  void changeMeal() {
    if (_meals.isNotEmpty) {
      List<Meal> filteredMeals = _meals
          .where((element) => _selectedCategories[element.category] == true)
          .toList();

      int index = Random().nextInt(filteredMeals.length);
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
