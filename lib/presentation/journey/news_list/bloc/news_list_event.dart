class NewsListEvent {}

class FetchNewsListEvent extends NewsListEvent {
  final String? query;

  FetchNewsListEvent({this.query});
}
