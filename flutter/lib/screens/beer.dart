import 'package:flutter/material.dart';
import 'package:mobile_meal_advisor/widgets/beer/menu.dart';
import 'package:mobile_meal_advisor/widgets/beer/top_bar.dart';

class BeerPage extends StatelessWidget {
  const BeerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: SafeArea(
        child: Column(
          children: const <Widget>[
            BeerTopBar(),
            Expanded(
              child: BeerCategoryList(),
            ),
          ],
        ),
      ),
    );
  }
}
