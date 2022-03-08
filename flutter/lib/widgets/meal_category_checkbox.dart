import 'package:flutter/material.dart';
import 'package:mobile_meal_advisor/meals.dart';

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}

class MealCategoryCheckbox extends StatefulWidget {
  final Function(MealCategory, bool?) onChanged;
  final MealCategory category;
  final bool? initialValue;

  const MealCategoryCheckbox({
    Key? key,
    required this.onChanged,
    required this.category,
    required this.initialValue,
  }) : super(key: key);

  @override
  State<MealCategoryCheckbox> createState() => _MealCategoryCheckboxState();
}

class _MealCategoryCheckboxState extends State<MealCategoryCheckbox> {
  bool? _value;

  @override
  void initState() {
    super.initState();
    _value = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      title: Text(_mealCategoryStringify(widget.category)),
      value: _value,
      onChanged: (bool? value) {
        setState(() {
          _value = value;
          widget.onChanged(widget.category, value);
        });
      },
    );
  }

  String _mealCategoryStringify(MealCategory category) {
    String value = category.toString().split('.').last;
    if (value == "tarteFlambee") value = "Tarte Flambée";
    return value.capitalize();
  }
}
