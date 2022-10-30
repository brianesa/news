import 'package:news/data/models/news_list_model.dart';
import 'package:news/domain/repositories/news_list_repository.dart';

class NewsListUseCase {
  final NewsListRepository newsListRepository;

  NewsListUseCase({required this.newsListRepository});

  Future<List<NewsModel>> fetchNewsList({String? query}) async {
    return await newsListRepository.fetchNewsList(query: query);
  }
}
