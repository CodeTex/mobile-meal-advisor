import 'package:flutter/material.dart';
import 'package:mobile_meal_advisor/theme.dart';
import 'package:mobile_meal_advisor/widgets/bordered_box.dart';

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
