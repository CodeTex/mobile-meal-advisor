import 'package:flutter/material.dart';
import 'package:mobile_meal_advisor/beers.dart';
import 'package:mobile_meal_advisor/theme.dart';

class BeerPage extends StatelessWidget {
  const BeerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                border: Border.symmetric(
                  horizontal: BorderSide(
                    color: Palette.border,
                    width: 6,
                  ),
                ),
                color: Palette.secondary,
              ),
              height: 80,
              child: Center(
                child: Row(
                  children: const <Widget>[
                    Expanded(
                      child: Divider(
                        color: Palette.border,
                        endIndent: 10,
                        indent: 20,
                        thickness: 2,
                      ),
                    ),
                    Text(
                      "Beer Menu",
                      style: TextStyle(
                        color: Palette.border,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        // overflow: TextOverflow.ellipsis,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Expanded(
                      child: Divider(
                        color: Palette.border,
                        endIndent: 20,
                        indent: 10,
                        thickness: 2,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Expanded(
              child: BeerCategoryList(),
            ),
          ],
        ),
      ),
    );
  }
}

class BeerCategoryList extends StatelessWidget {
  const BeerCategoryList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(vertical: 10),
      itemCount: beerMap.length,
      itemBuilder: (BuildContext context, int index) {
        BeerCategory category = beerMap.keys.toList()[index];
        return _buildExpandableTile(context, beerMap[category]);
      },
      separatorBuilder: (BuildContext context, int index) => Divider(
        color: Theme.of(context).colorScheme.background,
        thickness: 6,
      ),
    );
  }

  Widget _buildExpandableTile(
      BuildContext context, BeerCategoryInformation? categoryInformation) {
    return ListTileTheme(
      // tileColor: Colors.blue,
      child: ExpansionTile(
        textColor: Colors.black87,
        collapsedTextColor: Colors.black,
        backgroundColor: Theme.of(context).colorScheme.background,
        collapsedBackgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(categoryInformation!.name),
        children: categoryInformation.beers
            .map(
              (beer) => ListTile(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 10,
                      child: Text(
                        beer.name,
                      ),
                    ),
                    Text(_priceString(beer.price)),
                  ],
                ),
              ),
            )
            .toList(),
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
