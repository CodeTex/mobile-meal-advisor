enum CalorieCategory {
  undefined,
  low,
  high,
}

enum MealCategory {
  undefined,
  burger,
  classic,
  dessert,
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
      price: _setPriceField(json),
      vegetarian: _setVegetarianField(json),
      vegan: _setVeganField(json),
      calories: _setCalorieCategory(json, "undefined"),
      category: _setMealCategory(json, "undefined"),
      imageFileName: _setImageFileName(json, imageNotFound));
}

double? _setPriceField(Map<String, dynamic> json) {
  return json.containsKey("price") ? json["price"].toDouble() : null;
}

bool _setVegetarianField(Map<String, dynamic> json) {
  return json.containsKey("vegetarian") ? json["vegetarian"] : false;
}

bool _setVeganField(Map<String, dynamic> json) {
  return json.containsKey("vegan") ? json["vegan"] : false;
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

String _setImageFileName(Map<String, dynamic> json, String alt) {
  return json.containsKey("image") ? ("meals/" + json["image"]) : alt;
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
