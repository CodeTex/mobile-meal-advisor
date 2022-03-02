class Meal {
  String name;
  String text;
  bool vegetarian;
  bool vegan;
  double price;
  String imageFileName;

  static const String imageNotFound = "img-not-found-alt.jpg";

  Meal({
    required this.name,
    required this.text,
    required this.price,
    this.vegetarian = false,
    this.vegan = false,
    this.imageFileName = imageNotFound,
  });

  factory Meal.fromJson(Map<String, dynamic> json) => Meal(
        name: json["name"],
        text: json["text"],
        price: json["price"],
        vegetarian: json.containsKey("vegetarian") ? json["vegetarian"] : false,
        vegan: json.containsKey("vegan") ? json["vegan"] : false,
        imageFileName:
            json.containsKey("image") ? ("meals/" + json["image"]) : imageNotFound,
      );
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
Meal defaultMeal = Meal(name: "", text: "", price: 12.3);
