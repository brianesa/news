import 'package:flutter/material.dart';
import 'package:news/common/injector/injector_config.dart';
import 'package:news/common/route/route_constants.dart';
import 'package:news/data/models/news_list_model.dart';
import 'package:news/presentation/journey/news_detail/news_detail_screen.dart';
import 'package:news/presentation/journey/news_detail/news_detail_webview.dart';
import 'package:news/presentation/journey/news_list/news_list_screen.dart';

void main() {
  Injector.setup();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NewsListScreen(),
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case RouteConstants.newsList:
            return MaterialPageRoute(builder: (context) {
              return NewsListScreen();
            });
          case RouteConstants.newsDetail:
            return MaterialPageRoute(builder: (context) {
              return NewsDetailScreen(
                newsModel: settings.arguments as NewsModel,
              );
            });
          case RouteConstants.webView:
            return MaterialPageRoute(builder: (context) {
              return NewsDetailWebview(url: settings.arguments as String);
            });
          default:
        }
      },
    );
  }
}
