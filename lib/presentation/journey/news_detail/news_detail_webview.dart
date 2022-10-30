import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsDetailWebview extends StatefulWidget {
  final String url;

  const NewsDetailWebview({Key? key, required this.url}) : super(key: key);
  @override
  NewsDetailWebviewState createState() => NewsDetailWebviewState();
}

class NewsDetailWebviewState extends State<NewsDetailWebview> {
  @override
  void initState() {
    super.initState();
    // Enable virtual display.
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return WebView(
      initialUrl: widget.url,
    );
  }
}
