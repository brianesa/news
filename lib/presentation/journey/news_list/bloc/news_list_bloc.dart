import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/data/models/news_list_model.dart';
import 'package:news/domain/usecases/news_list_usecase.dart';
import 'package:news/presentation/journey/news_list/bloc/news_list_event.dart';
import 'package:news/presentation/journey/news_list/bloc/news_list_state.dart';

class NewsListBloc extends Bloc<NewsListEvent, List<NewsModel>> {
  NewsListUseCase newsListUseCase;
  NewsListBloc({
    required this.newsListUseCase,
  }) : super([]) {
    on<FetchNewsListEvent>((event, emit) async {
      emit([]);
      emit(await newsListUseCase.fetchNewsList(query: event.query));
    });
  }
}
