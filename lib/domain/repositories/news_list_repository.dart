import 'package:news/data/models/news_list_model.dart';

abstract class NewsListRepository {
  Future<List<NewsModel>> fetchNewsList({String? query});
}
