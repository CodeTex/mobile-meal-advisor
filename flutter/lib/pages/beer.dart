import 'package:flutter/material.dart';
import 'package:mobile_meal_advisor/beers.dart';
import 'package:mobile_meal_advisor/theme.dart';

class BeerPage extends StatelessWidget {
  const BeerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      padding: const EdgeInsets.all(10),
      itemCount: beerMap.length,
      itemBuilder: (BuildContext context, int index) {
        BeerCategory category = beerMap.keys.toList()[index];
        return _buildExpandableTile(context, beerMap[category]);
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(),
    );
  }

  Widget _buildExpandableTile(BuildContext context, categoryInformation) {
    return ExpansionTile(
      title: Text(categoryInformation["name"]),
      children: <Widget>[
        ListTile(
          title: Text(
            categoryInformation["text"],
            style: const TextStyle(fontWeight: FontWeight.w700),
          ),
        )
      ],
    );
  }
}
