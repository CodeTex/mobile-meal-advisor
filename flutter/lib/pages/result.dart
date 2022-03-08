import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile_meal_advisor/data/url_list.dart';
import 'package:mobile_meal_advisor/meals.dart';
import 'package:mobile_meal_advisor/pages/home.dart';
import 'package:mobile_meal_advisor/theme.dart';
import 'package:mobile_meal_advisor/widgets/bordered_box.dart';
import 'package:url_launcher/url_launcher.dart';

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}

class ResultPage extends StatefulWidget {
  const ResultPage({Key? key}) : super(key: key);

  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  late List<Meal> meals;
  Meal selectedMeal = defaultMeal;
  late Map<MealCategory, bool?> selectedCategories;

  @override
  void initState() {
    super.initState();
    loadMealsFromFile();
    setState(() {
      selectedCategories = _createCategoryMap();
    });
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

  void changeMeal() {
    if (meals.isNotEmpty) {
      List<Meal> filteredMeals =
          meals.where((element) => selectedCategories[element.category] == true).toList();

      int index = Random().nextInt(filteredMeals.length);
      setState(() {
        selectedMeal = filteredMeals[index];
      });
    } else {
      setState(() {
        selectedMeal = defaultMeal;
      });
    }
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

  void _onFilterSelect(MealCategory category, bool? value) {
    setState(() {
      selectedCategories[category] = value;
    });
  }

  Future<void> _showFilterDialog(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return CategoryFilter(
          selectedCategories: selectedCategories,
          onfilterSelect: _onFilterSelect,
        );
      },
    );
  }
}

class CategoryFilter extends StatefulWidget {
  final void Function(MealCategory, bool?) onfilterSelect;
  final Map<MealCategory, bool?> selectedCategories;
  const CategoryFilter(
      {Key? key, required this.selectedCategories, required this.onfilterSelect})
      : super(key: key);

  @override
  State<CategoryFilter> createState() => _CategoryFilterState();
}

class _CategoryFilterState extends State<CategoryFilter> {
  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: const Text("Select filters:"),
      children: widget.selectedCategories.keys
          .map((category) => CheckboxListTile(
                title: Text(_mealCategoryStringify(category)),
                value: widget.selectedCategories[category],
                onChanged: (bool? value) {
                  widget.onfilterSelect(category, value);
                  widget.selectedCategories[category] = value;
                },
              ))
          .toList(),
    );
  }

  String _mealCategoryStringify(MealCategory category) {
    String value = category.toString().split('.').last;
    if (value == "tarteFlambee") value = "Tarte Flambée";
    return value.capitalize();
  }
}

class ResultTopBar extends StatelessWidget {
  final List<String> urlList = randomUrlList;
  final VoidCallback reloadAction;
  final VoidCallback filterAction;

  ResultTopBar({
    Key? key,
    required this.reloadAction,
    required this.filterAction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border.symmetric(
          horizontal: BorderSide(color: Palette.borderColor, width: .2),
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(children: <Widget>[
            IconButton(
              icon: const Icon(Icons.replay_outlined),
              onPressed: reloadAction,
            ),
            IconButton(
              icon: const Icon(Icons.filter_alt),
              onPressed: filterAction,
            ),
          ]),
          Row(
            children: <Widget>[
              IconButton(
                icon: const Icon(Icons.auto_fix_high),
                onPressed: _launchRandomURL,
              ),
              IconButton(
                icon: const Icon(Icons.local_drink),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.add_box_outlined),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.home),
                onPressed: () async {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const HomePage(),
                    ),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw "Could not launch $url";
    }
  }

  void _launchRandomURL() {
    if (urlList.isNotEmpty) {
      int index = Random().nextInt(urlList.length);
      _launchURL(urlList[index]);
    }
  }
}

class ResultTitle extends StatelessWidget {
  final String title;

  const ResultTitle({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
      child: SlimBorderedBox(
        backgroundColor: Theme.of(context).colorScheme.background,
        borderColor: Palette.borderColor,
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(10),
          child: Text(
            title,
            style: const TextStyle(
              color: Palette.borderColor,
              fontSize: 24,
              fontWeight: FontWeight.bold,
              // overflow: TextOverflow.ellipsis,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}

class ResultImage extends StatelessWidget {
  final String fileName;

  const ResultImage({
    Key? key,
    required this.fileName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          border: const Border.symmetric(
            horizontal: BorderSide(
              color: Palette.borderColor,
              width: 2,
            ),
          ),
          color: Theme.of(context).colorScheme.background,
        ),
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fitHeight,
              image: AssetImage("assets/images/" + fileName),
            ),
          ),
          // child: Image.asset("assets/images/" + fileName),
        ));
  }

  // AssetImage _load_img(String path,
  //     {String altPath = "assets/images/img-not-found.png"}) {
  //   AssetImage img;
  //   try {
  //     print(">>> " + path);
  //     img = AssetImage(path);
  //   } on FlutterError {
  //   } catch (_) {
  //     print(">>> " + altPath);
  //     img = AssetImage(altPath);
  //   }
  //   return img;
  // }
}

class ResultDescription extends StatelessWidget {
  final String text;
  final double? price;
  final bool isVegetarian;
  final bool isVegan;

  const ResultDescription({
    Key? key,
    required this.text,
    this.price,
    this.isVegetarian = false,
    this.isVegan = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
      child: SlimBorderedBox(
        backgroundColor: Theme.of(context).colorScheme.background,
        borderColor: Palette.borderColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: Container(
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 10,
                ),
                child: Text(text),
              ),
            ),
            const Divider(
              height: 2,
              thickness: 2,
              color: Palette.borderColor,
              indent: 10,
              endIndent: 10,
            ),
            Container(
              alignment: Alignment.center,
              height: 30,
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      if (isVegan) ...[
                        const Image(
                          image: AssetImage("assets/images/icons/vegan.png"),
                          height: 26,
                          semanticLabel: "this meal is vegan",
                        ),
                        const SizedBox(width: 10),
                      ],
                      if (isVegetarian) ...[
                        const Image(
                          image: AssetImage("assets/images/icons/no-meat.png"),
                          height: 26,
                          semanticLabel: "this meal is vegetarian",
                        )
                      ],
                    ],
                  ),
                  Text(
                    _priceString(price),
                    style: const TextStyle(
                      fontSize: 18,
                      color: Palette.borderColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _priceString(double? price) {
    String priceString = "€ ";
    if (price == null) {
      priceString += "n.a.";
    } else {
      priceString += price.toStringAsFixed(2).replaceAll(".", ",");
    }
    return priceString;
  }
}
