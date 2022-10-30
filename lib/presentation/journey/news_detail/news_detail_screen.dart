import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:news/common/route/route_constants.dart';
import 'package:news/data/models/news_list_model.dart';

class NewsDetailScreen extends StatelessWidget {
  final NewsModel newsModel;
  const NewsDetailScreen({Key? key, required this.newsModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              newsModel.title ?? '',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              newsModel.source ?? '',
              style: TextStyle(
                  fontStyle: FontStyle.italic,
                  decoration: TextDecoration.underline),
            ),
            Text(newsModel.date ?? ''),
            SizedBox(
              height: 50,
            ),
            Text.rich(
              TextSpan(text: newsModel.content ?? '', children: [
                TextSpan(
                    text: 'Read More',
                    style: TextStyle(color: Colors.blueAccent),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => Navigator.pushNamed(context, RouteConstants.webView,
                          arguments: newsModel.url))
              ]),
            )
          ],
        ),
      ),
    );
  }
}
