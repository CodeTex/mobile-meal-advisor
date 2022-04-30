import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';
import 'package:flutter/material.dart';
import 'package:mobile_meal_advisor/models/viewer.dart';

class PDFMenuViewer extends StatefulWidget {
  final String pdfLink;
  final PDFSourceType sourceType;

  const PDFMenuViewer({
    Key? key,
    required this.pdfLink,
    required this.sourceType,
  }) : super(key: key);

  @override
  State<PDFMenuViewer> createState() => _PDFMenuViewerState();
}

class _PDFMenuViewerState extends State<PDFMenuViewer> {
  bool _isLoading = true;
  late PDFDocument _pdf;

  void _loadFile() async {
    switch (widget.sourceType) {
      case PDFSourceType.url:
        _pdf = await PDFDocument.fromURL(widget.pdfLink);
        break;
      case PDFSourceType.file:
        _pdf = await PDFDocument.fromAsset(widget.pdfLink);
        break;
    }

    setState(() {
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _loadFile();
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? const Center(child: CircularProgressIndicator())
        : PDFViewer(document: _pdf);
  }
}
