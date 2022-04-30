import 'package:flutter/material.dart';
import 'package:mobile_meal_advisor/functions/string.dart';
import 'package:mobile_meal_advisor/models/store.dart';
import 'package:mobile_meal_advisor/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FilterCategoryDialog extends StatefulWidget {
  final List<String> categories;
  final List<String> selectedCategories;
  final ValueChanged<List<String>> onSelectedCategoryChanged;

  const FilterCategoryDialog({
    Key? key,
    required this.categories,
    required this.selectedCategories,
    required this.onSelectedCategoryChanged,
  }) : super(key: key);

  @override
  State<FilterCategoryDialog> createState() => _FilterCategoryDialogState();
}

class _FilterCategoryDialogState extends State<FilterCategoryDialog> {
  final ScrollController _scrollController = ScrollController();
  List<String> _tempSelectedCategories = <String>[];

  @override
  void initState() {
    _tempSelectedCategories = widget.selectedCategories;
    super.initState();
  }

  void _updateSharedPreferences(List<String> categories) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList(keyFilterCategories, categories);
  }

  void _updateSelectedCategories(String category, bool addElement) {
    if (addElement) {
      if (!_tempSelectedCategories.contains(category)) {
        setState(() {
          _tempSelectedCategories.add(category);
        });
      }
    } else {
      if (_tempSelectedCategories.contains(category)) {
        setState(() {
          _tempSelectedCategories.removeWhere((String cat) => cat == category);
        });
      }
    }

    _updateSharedPreferences(_tempSelectedCategories);
    widget.onSelectedCategoryChanged(_tempSelectedCategories);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: const EdgeInsets.symmetric(vertical: 20),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      title: const Text("Apply filters:"),
      content: Container(
        decoration: BoxDecoration(
          border: Border.symmetric(
            horizontal: BorderSide(
              color: Palette.borderColor.withOpacity(.6),
              width: 1,
            ),
          ),
        ),
        height: MediaQuery.of(context).size.height / 2,
        width: 400,
        child: Scrollbar(
          isAlwaysShown: true,
          controller: _scrollController,
          child: ListView(
            controller: _scrollController,
            shrinkWrap: true,
            children: <CheckboxListTile>[
              ...List.generate(
                widget.categories.length,
                (index) {
                  final String category = widget.categories[index];
                  return CheckboxListTile(
                    title: Text(capitalize(category)),
                    value: _tempSelectedCategories.contains(category),
                    onChanged: (bool? value) => {
                      // default is false
                      value = value ?? false,
                      _updateSelectedCategories(category, value),
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
      actions: <Row>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: ElevatedButton(
                child: const Text("Select all"),
                style: ElevatedButton.styleFrom(
                  primary: const Color(0xFFA6B401).withOpacity(.9),
                ),
                onPressed: () {
                  setState(() {
                    _tempSelectedCategories = widget.categories;
                  });
                  _updateSharedPreferences(_tempSelectedCategories);
                },
              ),
            ),
            SizedBox(width: MediaQuery.of(context).size.width * .02),
            Expanded(
              child: ElevatedButton(
                child: const Text("Deselect all"),
                style: ElevatedButton.styleFrom(
                  primary: const Color(0xFFD50102).withOpacity(.9),
                ),
                onPressed: () {
                  setState(() {
                    _tempSelectedCategories = [];
                  });
                  _updateSharedPreferences(_tempSelectedCategories);
                },
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: ElevatedButton(
                child: const Text("Close"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            )
          ],
        )
      ],
    );
  }
}
