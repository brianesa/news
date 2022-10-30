import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news/data/models/news_list_model.dart';

class NewsListRemoteDataSource {
  Future<List<NewsModel>> fetchNewsList({String? query}) async {
    final response = await http.get(Uri.https('newsapi.org', '/v2/everything', {
      'q': query != null && query.isNotEmpty ? '${query}' : 'null',
      'apiKey': '82a67b86f8e54e5a8363501e59cef682',
    }));
    print(response.body);

    Map<String, dynamic> result = json.decode(response.body);

    print(result);

    return (result['articles'] as List)
        .map((e) => NewsModel.fromJson(e))
        .toList();
  }
}
