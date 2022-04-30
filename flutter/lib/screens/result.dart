import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile_meal_advisor/services/meals.dart';
import 'package:mobile_meal_advisor/theme.dart';
import 'package:mobile_meal_advisor/widgets/meal_category_checkbox.dart';
import 'package:mobile_meal_advisor/widgets/result/description.dart';
import 'package:mobile_meal_advisor/widgets/result/image.dart';
import 'package:mobile_meal_advisor/widgets/result/title.dart';
import 'package:mobile_meal_advisor/widgets/result/top_bar.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({Key? key}) : super(key: key);

  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  late List<Meal> meals = [];
  late Meal selectedMeal;
  late Map<MealCategory, bool?> selectedCategories;

  @override
  void initState() {
    super.initState();
    selectedMeal = Meal(name: "", text: "");
    loadMealsFromFile();
    setState(() {
      selectedCategories = _createCategoryMap();
    });
  }

  Future<void> loadMealsFromFile() async {
    String path = "assets/data/meals.json";
    final String response = await rootBundle.loadString(path);
    final data = await json.decode(response);
    setState(() {
      meals = Meals.fromJson(data).meals;
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
          children: selectedCategories.keys
              .map(
                (category) => MealCategoryCheckbox(
                  onChanged: _changeCategorySelection,
                  category: category,
                  initialValue: selectedCategories[category],
                ),
              )
              .toList(),
        );
      },
    );
  }

  void _changeCategorySelection(MealCategory category, bool? value) {
    setState(() {
      selectedCategories[category] = value;
    });
  }

  void changeMeal() {
    if (meals.isNotEmpty) {
      List<Meal> filteredMeals =
          meals.where((element) => selectedCategories[element.category] == true).toList();

      int index = Random().nextInt(filteredMeals.length);
      setState(() {
        selectedMeal = filteredMeals[index];
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
                title: selectedMeal.name,
              ),
            ),
            Expanded(
              flex: 5,
              child: ResultImage(
                fileName: selectedMeal.imageFileName,
              ),
            ),
            Expanded(
              flex: 4,
              child: ResultDescription(
                text: selectedMeal.text,
                price: selectedMeal.price,
                isVegetarian: selectedMeal.vegetarian,
                isVegan: selectedMeal.vegan,
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                decoration: const BoxDecoration(
                  border: Border.symmetric(
                    horizontal: BorderSide(
                      color: Palette.borderColor,
                      width: .2,
                    ),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset("assets/images/icons/work-in-progress.png"),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset("assets/images/icons/under-construction.png"),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
