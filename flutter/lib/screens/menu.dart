import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mobile_meal_advisor/models/viewer.dart';
import 'package:mobile_meal_advisor/widgets/pdf_viewer.dart';

class MenuPage extends StatelessWidget {
  final String menuLink;
  final String appBarTitle = "Menu";

  const MenuPage({
    Key? key,
    required this.menuLink,
  }) : super(key: key);

  Viewer? _selectViewer(String link) {
    if (link.endsWith(".pdf")) {
      return Viewer.pdf;
    } else if (link.contains("http")) {
      return Viewer.html;
    } else {
      log("Cannot match link with viewer: " + link);
      return null;
    }
  }

  Widget _displayViewer(String link) {
    PDFSourceType sourceType;
    Viewer? viewer = _selectViewer(link);

    switch (viewer) {
      case null:
        return const Center(child: Text("Invalid menu link."));
      case Viewer.html:
        return Container();
      case Viewer.pdf:
        if (link.startsWith("http")) {
          sourceType = PDFSourceType.url;
        } else {
          sourceType = PDFSourceType.file;
        }
        return PDFViewer(
          title: appBarTitle,
          pdfLink: link,
          sourceType: sourceType,
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return _displayViewer(menuLink);
  }
}
