import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mobile_meal_advisor/constants/url_list.dart';
import 'package:mobile_meal_advisor/functions/math.dart';
import 'package:mobile_meal_advisor/screens/beer.dart';
import 'package:mobile_meal_advisor/screens/home.dart';
import 'package:mobile_meal_advisor/theme.dart';
import 'package:mobile_meal_advisor/widgets/web_viewer.dart';

class ResultTopBar extends StatelessWidget {
  final List<String> urlList = randomUrlList;
  final VoidCallback reloadAction;
  final VoidCallback filterAction;

  ResultTopBar({
    Key? key,
    required this.reloadAction,
    required this.filterAction,
  }) : super(key: key);

  void _openWebViewer(BuildContext context, String title, String? url) {
    if (url == null) {
      log("Invalid url passed: " + url!);
      return;
    }
    print("URL: " + url);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) {
        return WillPopScope(
          onWillPop: () async {
            Navigator.pop(context, false);
            return Future.value(false);
          },
          child: WebViewer(
            title: title,
            webLink: url,
          ),
        );
      }),
    );
  }

  String? _randomURL() {
    if (urlList.isNotEmpty) {
      int index = randint(0, urlList.length - 1);
      // launch in WebViewer
      return urlList[index];
    }
    return null;
  }

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
        children: <Row>[
          Row(children: <IconButton>[
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
            IconButton(
              icon: const Icon(Icons.filter_alt),
              onPressed: filterAction,
            ),
            IconButton(
              icon: const Icon(Icons.replay_outlined),
              onPressed: reloadAction,
            ),
          ]),
          Row(
            children: <IconButton>[
              IconButton(
                icon: const Icon(Icons.auto_fix_high),
                onPressed: () {
                  _openWebViewer(context, "Enjoy", _randomURL());
                },
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
                  _openWebViewer(
                    context,
                    "Menu",
                    "https://www.stadtboden.at/menu/",
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
