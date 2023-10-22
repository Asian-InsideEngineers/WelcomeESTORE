import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class Privacy extends StatefulWidget {
  const Privacy({super.key});

  static const String routeName = "privacy";

  @override
  State<Privacy> createState() => _PrivacyState();
}

class _PrivacyState extends State<Privacy> {
  late PdfViewerController _policies;

  @override
  void initState() {
    _policies = PdfViewerController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Privacy & Policies",
          style:
              GoogleFonts.montserrat(fontSize: 22, fontWeight: FontWeight.w500),
        ),
      ),
      body: SfPdfViewer.asset(
        "assets/pdf/Policies.pdf",
        controller: _policies,
        initialZoomLevel: 1,
      ),
    );
  }
}
