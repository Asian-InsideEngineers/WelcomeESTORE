import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:webview_flutter/webview_flutter.dart';

class CustomerFeedback extends StatefulWidget {
  const CustomerFeedback({super.key});
  static const String routeName = "feedback";

  @override
  State<CustomerFeedback> createState() => _CustomerFeedbackState();
}

class _CustomerFeedbackState extends State<CustomerFeedback> {
  late WebViewController feedbackcontroller;
  double webprogress = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Customer Feedbacks",
          style:
              GoogleFonts.montserrat(fontSize: 18, fontWeight: FontWeight.bold),
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
              : const SizedBox(),
          Expanded(
            child: Center(
              child: WebView(
                initialUrl:
                    'https://docs.google.com/forms/d/e/1FAIpQLSeVLg63VVn7mDYiC-c3r4xn3JiRq9GO0_lxYmxbZxhCx48org/viewform?usp=sf_link',
                onProgress: (progress) {
                  setState(() {
                    webprogress = progress / 100;
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
