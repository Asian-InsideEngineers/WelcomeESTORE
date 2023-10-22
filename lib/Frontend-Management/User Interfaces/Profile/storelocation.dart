import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:welcomestoreapp/Frontend-Management/User%20Interfaces/dashboard.dart';

class GoogleMap extends StatefulWidget {
  const GoogleMap({super.key});
  static const String routeName = "googlemap";
  @override
  State<GoogleMap> createState() => _GoogleMapState();
}

class _GoogleMapState extends State<GoogleMap> {
  late WebViewController feedbackcontroller;
  double webprogress = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple.shade800,
        title: Row(
          children: [
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, Dashboard.routeName);
                },
                icon: const FaIcon(
                  FontAwesomeIcons.arrowLeft,
                  color: Colors.white,
                )),
            Text(
              "Store Location",
              style: GoogleFonts.montserrat(
                  fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          webprogress < 1
              ? SizedBox(
                  height: 10,
                  child: LinearProgressIndicator(
                    color: Colors.white,
                    value: webprogress,
                  ),
                )
              : SizedBox(),
          Expanded(
            child: Center(
              child: WebView(
                initialUrl:
                    'https://www.google.com/maps/place/DMLT+COLLEGE+IN+AURANGABAD/@19.9059445,75.3221608,15.22z/data=!4m5!3m4!1s0x0:0x13d25fd02d5e20bd!8m2!3d19.9113044!4d75.319499?hl=en',
                onProgress: (progress) {
                  setState(() {
                    this.webprogress = progress / 100;
                  });
                },
                javascriptMode: JavascriptMode.unrestricted,
                onWebViewCreated: (WebViewController moderator) {
                  feedbackcontroller = moderator;
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
