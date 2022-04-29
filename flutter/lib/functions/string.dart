import 'dart:math';

import 'package:mobile_meal_advisor/constants/greet_list.dart';

String capitalize(String s) => s[0].toUpperCase() + s.substring(1);

String greet(String? userName) {
  if (userName == null || userName == "") return "Goodbye!";

  String greeting = "Hello";
  String lastCharacter = "";
  List<String> greetings = [];
  int hourOfDay = DateTime.now().hour;

  greetings.addAll(greetingsEm);
  greetings.addAll(greetingsQm);
  if (hourOfDay < 11) {
    greetings.add("good morning");
  } else if (hourOfDay < 14) {
    greetings.add("mahlzeit");
  } else if (hourOfDay < 18) {
    greetings.add("good afternoon");
  } else {
    greetings.add("good evening");
  }

  if (greetings.isNotEmpty) {
    int index = Random().nextInt(greetings.length);
    greeting = capitalize(greetings[index]);
    if (greetingsQm.contains(greetings[index])) {
      lastCharacter = "?";
    } else {
      lastCharacter = "!";
    }
  }
  if (userName != null) greeting += ", " + userName;
  return greeting + lastCharacter;
}
