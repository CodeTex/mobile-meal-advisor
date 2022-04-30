import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mobile_meal_advisor/constants/url_list.dart';
import 'package:mobile_meal_advisor/screens/beer.dart';
import 'package:mobile_meal_advisor/screens/home.dart';
import 'package:mobile_meal_advisor/theme.dart';
import 'package:url_launcher/url_launcher.dart';

class ResultTopBar extends StatelessWidget {
  final List<String> urlList = randomUrlList;
  final VoidCallback reloadAction;
  final VoidCallback filterAction;

  ResultTopBar({
    Key? key,
    required this.reloadAction,
    required this.filterAction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border.symmetric(
          horizontal: BorderSide(color: Palette.borderColor, width: .2),
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(children: <Widget>[
            IconButton(
              icon: const Icon(Icons.replay_outlined),
              onPressed: reloadAction,
            ),
            IconButton(
              icon: const Icon(Icons.filter_alt),
              onPressed: filterAction,
            ),
          ]),
          Row(
            children: <Widget>[
              IconButton(
                icon: const Icon(Icons.auto_fix_high),
                onPressed: _launchRandomURL,
              ),
              IconButton(
                icon: const Icon(Icons.local_drink),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const BeerPage(),
                    ),
                  );
                },
              ),
              IconButton(
                icon: const Icon(Icons.menu_book_sharp),
                onPressed: () {
                  _launchURL("https://www.stadtboden.at/menu/");
                },
              ),
              IconButton(
                icon: const Icon(Icons.home),
                onPressed: () async {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const HomePage(),
                    ),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw "Could not launch $url";
    }
  }

  void _launchRandomURL() {
    if (urlList.isNotEmpty) {
      int index = Random().nextInt(urlList.length);
      _launchURL(urlList[index]);
    }
  }
}
