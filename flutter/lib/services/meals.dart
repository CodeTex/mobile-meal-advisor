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
      name: _setStringField(json, "name", "undefined"),
      text: _setStringField(json, "text", "undefined"),
      price: _setDoubleField(json),
      vegetarian: _setBooleanField(json, "vegetarian"),
      vegan: _setBooleanField(json, "vegan"),
      calories: _setCalorieCategory(json, "undefined"),
      category: _setMealCategory(json, "undefined"),
      imageFileName: _setImageFileName(json, imageNotFound));
}

String _setStringField(Map<String, dynamic> json, String field, String alt) =>
    json.containsKey(field) ? json[field] : alt;

double? _setDoubleField(Map<String, dynamic> json) =>
    json.containsKey("price") ? json["price"].toDouble() : null;

bool _setBooleanField(Map<String, dynamic> json, String field, {bool alt = false}) =>
    json.containsKey(field) ? json[field] : alt;

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

String _setImageFileName(Map<String, dynamic> json, String alt) =>
    json.containsKey("image") ? ("meals/" + json["image"]) : alt;

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
