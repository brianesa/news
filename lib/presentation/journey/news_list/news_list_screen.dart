import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiwi/kiwi.dart';
import 'package:news/common/injector/injector_config.dart';
import 'package:news/common/route/route_constants.dart';
import 'package:news/data/models/news_list_model.dart';
import 'package:news/presentation/journey/news_list/bloc/news_list_bloc.dart';
import 'package:news/presentation/journey/news_list/bloc/news_list_event.dart';

class NewsListScreen extends StatefulWidget {
  const NewsListScreen({Key? key}) : super(key: key);

  @override
  State<NewsListScreen> createState() => _NewsListScreenState();
}

class _NewsListScreenState extends State<NewsListScreen> {
  KiwiContainer container = KiwiContainer();
  late NewsListBloc _newsListBloc;
  TextEditingController _textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    print('masuk 1');
    _newsListBloc = container.resolve<NewsListBloc>()
      ..add(FetchNewsListEvent(query: _textEditingController.text));
    print('masuk 2');
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => _newsListBloc,
      child: Scaffold(
        appBar: AppBar(
          title: TextField(
            controller: _textEditingController,
            decoration: InputDecoration(hintText: 'Search...'),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: InkWell(
                onTap: () {
                  _newsListBloc.add(
                      FetchNewsListEvent(query: _textEditingController.text));
                },
                child: Icon(Icons.search),
              ),
            )
          ],
        ),
        body: BlocBuilder<NewsListBloc, List<NewsModel>>(
            bloc: _newsListBloc,
            builder: (context, news) {
              if (news.isEmpty) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }

              return ListView.separated(
                itemCount: news.length,
                separatorBuilder: (context, index) => Divider(
                  thickness: 2,
                ),
                itemBuilder: (context, i) {
                  return ListTile(
                    title: Text(news[i].title ?? ''),
                    trailing: Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      Navigator.pushNamed(context, RouteConstants.newsDetail,
                          arguments: news[i]);
                    },
                  );
                },
              );
            }),
      ),
    );
  }
}
