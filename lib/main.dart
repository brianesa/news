import 'package:flutter/material.dart';
import 'package:news/common/injector/injector_config.dart';
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
    );
  }
}
