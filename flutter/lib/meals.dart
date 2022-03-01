class Meal {
  String name;
  String text;
  double price;
  String imageFileName;

  Meal({
    required this.name,
    required this.text,
    required this.price,
    this.imageFileName = "assets/images/img-not-found.png",
  });

  factory Meal.fromJson(Map<String, dynamic> json) => Meal(
        name: json["name"],
        text: json["text"],
        price: json["price"],
        imageFileName: json["image"],
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

Meal defaultMeal =
    Meal(name: "", text: "", price: 12.3, imageFileName: "img-not-found.png");
