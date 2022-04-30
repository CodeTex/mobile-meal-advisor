import 'package:advance_pdf_viewer/advance_pdf_viewer.dart' as apv;
import 'package:flutter/material.dart';
import 'package:mobile_meal_advisor/models/viewer.dart';
import 'package:mobile_meal_advisor/theme.dart';

class PDFViewer extends StatefulWidget {
  final String pdfLink;
  final PDFSourceType sourceType;
  final String title;

  const PDFViewer({
    Key? key,
    required this.pdfLink,
    required this.sourceType,
    required this.title,
  }) : super(key: key);

  @override
  State<PDFViewer> createState() => _PDFViewerState();
}

class _PDFViewerState extends State<PDFViewer> {
  bool _isLoading = true;
  late apv.PDFDocument _pdf;

  void _loadFile() async {
    switch (widget.sourceType) {
      case PDFSourceType.url:
        _pdf = await apv.PDFDocument.fromURL(widget.pdfLink);
        break;
      case PDFSourceType.file:
        _pdf = await apv.PDFDocument.fromAsset(widget.pdfLink);
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
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      backgroundColor: Palette.primary.withOpacity(.8),
      body: SafeArea(
        child: _isLoading
            ? const Center(child: CircularProgressIndicator())
            : apv.PDFViewer(document: _pdf),
      ),
    );
  }
}
