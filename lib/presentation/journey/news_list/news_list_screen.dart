import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiwi/kiwi.dart';
import 'package:news/common/injector/injector_config.dart';
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

  @override
  void initState() {
    super.initState();
    _newsListBloc = container.resolve<NewsListBloc>()
      ..add(FetchNewsListEvent(query: 'tesla'));
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => _newsListBloc,
      child: Scaffold(
        body: ListView.separated(
          itemCount: 5,
          separatorBuilder: (context, index) => Divider(
            thickness: 2,
          ),
          itemBuilder: (context, index) {
            return ListTile(
              title: Text('tes'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {},
            );
          },
        ),
      ),
    );
  }
}
