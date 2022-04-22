enum CalorieCategory {
  undefined,
  low,
  high,
}

enum MealCategory {
  undefined,
  burger,
  classic,
  desert,
  fingerFood,
  salad,
  sandwich,
  sausage,
  tarteFlambee,
}

class Meal {
  String name;
  String text;
  bool vegetarian;
  bool vegan;
  CalorieCategory calories;
  MealCategory category;
  double? price;
  String imageFileName;

  static const String imageNotFound = "img-not-found-alt.jpg";

  Meal({
    required this.name,
    required this.text,
    this.vegetarian = false,
    this.vegan = false,
    this.calories = CalorieCategory.undefined,
    this.category = MealCategory.undefined,
    this.price,
    this.imageFileName = imageNotFound,
  });

  factory Meal.fromJson(Map<String, dynamic> json) => Meal(
        name: json["name"],
        text: json["text"],
        price: json.containsKey("price") ? json["price"].toDouble() : null,
        vegetarian: json.containsKey("vegetarian") ? json["vegetarian"] : false,
        vegan: json.containsKey("vegan") ? json["vegan"] : false,
        calories: _setCalorieCategory(json, "undefined"),
        category: _setMealCategory(json, "undefined"),
        imageFileName:
            json.containsKey("image") ? ("meals/" + json["image"]) : imageNotFound,
      );
}

// Meal() util
CalorieCategory _setCalorieCategory(Map<String, dynamic> json, String alt) {
  String value = json.containsKey("calories") ? json["calories"] : alt;
  return CalorieCategory.values
      .firstWhere((e) => e.toString() == "CalorieCategory." + value);
}

// Meal() util
MealCategory _setMealCategory(Map<String, dynamic> json, String alt) {
  String value = json.containsKey("category") ? json["category"] : alt;
  return MealCategory.values.firstWhere((e) => e.toString() == "MealCategory." + value);
}

class Meals {
  List<Meal> meals;

  Meals({required this.meals});

  factory Meals.fromJson(Map<String, dynamic> json) => Meals(
        meals: List<Meal>.from(
          json["meals"].map(
            (x) => Meal.fromJson(x),
          ),
        ),
      );
}

// TODO: remove this later on
Meal defaultMeal = Meal(name: "", text: "");
