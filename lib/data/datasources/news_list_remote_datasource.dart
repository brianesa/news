import 'package:http/http.dart' as http;

class NewsListRemoteDataSource {
  Future fetchNewsList({String? query}) async {
    final response = await http.get(Uri.https('newsapi.org', '/v2/everything', {
      'q': '${query}',
      'apiKey': '82a67b86f8e54e5a8363501e59cef682',
    }));
    print('masuk');
    print(response.body);
    return response;
  }
}
