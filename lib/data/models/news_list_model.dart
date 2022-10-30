import 'package:intl/intl.dart';

class NewsModel {
  String? title, description, content, source, date, url;

  NewsModel(
      {this.title, this.description, this.content, this.source, this.date});

  static String _getContent(Map<String, dynamic> json) {
    final content = (json['content'] as String);
    return content.length > 190 ? content.substring(0, 200) : content;
  }

  NewsModel.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        description = json['description'],
        content = _getContent(json),
        source = json['source']['name'],
        url = json['url'],
        date = DateFormat('yyyy-MM-dd')
            .format(DateTime.parse(json['publishedAt']));
}
