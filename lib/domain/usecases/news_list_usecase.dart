import 'package:news/domain/repositories/news_list_repository.dart';

class NewsListUseCase {
  final NewsListRepository newsListRepository;

  NewsListUseCase({required this.newsListRepository});

  Future fetchNewsList({String? query}) async {
    return await newsListRepository.fetchNewsList(query: query);
  }
}
