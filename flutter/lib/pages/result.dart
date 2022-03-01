import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile_meal_advisor/meals.dart';
import 'package:mobile_meal_advisor/theme.dart';
import 'package:mobile_meal_advisor/widgets/bordered_box.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({Key? key}) : super(key: key);

  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  List<Meal> meals = <Meal>[];
  Meal selectedMeal = defaultMeal;

  @override
  void initState() {
    loadMealsFromFile();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
              ),
              child: const ResultTopBar(),
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
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                ),
                child: Center(
                  child: ElevatedButton(
                    child: const Text("Choose Meal"),
                    onPressed: () {
                      changeMeal();
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Theme.of(context).colorScheme.background,
                      onPrimary: Colors.black,
                    ),
                  ),
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
      int index = Random().nextInt(meals.length);
      setState(() {
        selectedMeal = meals[index];
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
}

class ResultTopBar extends StatelessWidget {
  const ResultTopBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const <Widget>[
          Icon(
            Icons.favorite,
          ),
          Icon(
            Icons.alarm,
          ),
        ],
      ),
    );
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
        child: Center(
          child: Text(title),
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
  final double price;

  const ResultDescription({
    Key? key,
    required this.text,
    required this.price,
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
              alignment: Alignment.centerRight,
              height: 30,
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                "€ " + price.toStringAsFixed(2).replaceAll(".", ","),
                style: const TextStyle(
                  fontSize: 18,
                  color: Palette.borderColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
