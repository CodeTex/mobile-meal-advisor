class Meal {
  String name;
  String text;
  double price;
  String imageFileName;
  static const String imageNotFound = "img-not-found-alt.jpg";

  Meal({
    required this.name,
    required this.text,
    required this.price,
    this.imageFileName = imageNotFound,
  });

  factory Meal.fromJson(Map<String, dynamic> json) => Meal(
        name: json["name"],
        text: json["text"],
        price: json["price"],
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
