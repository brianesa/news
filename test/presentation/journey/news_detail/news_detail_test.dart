import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:news/data/models/news_list_model.dart';
import 'package:news/presentation/journey/news_detail/news_detail_screen.dart';

void main() {
  testWidgets('MyWidget has a title and message', (tester) async {
    // Create the widget by telling the tester to build it.
    await tester.pumpWidget(
        MaterialApp(home: NewsDetailScreen(newsModel: NewsModel())));

    expect(find.byType(Scaffold), findsOneWidget);
  });
}
