import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class Terms extends StatefulWidget {
  const Terms({super.key});

  static const String routeName = "Terms";
  @override
  State<Terms> createState() => _TermsState();
}

class _TermsState extends State<Terms> {
  late PdfViewerController _condtions;
  @override
  void initState() {
    _condtions = PdfViewerController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Terms & Conditions",
            style: GoogleFonts.montserrat(
              fontSize: 22,
              fontWeight: FontWeight.w400,
            )),
      ),
      body: SfPdfViewer.asset(
        'assets/pdf/Terms.pdf',
        controller: _condtions,
        initialZoomLevel: 1,
      ),
    );
  }
}
