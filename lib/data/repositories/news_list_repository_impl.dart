import 'package:flutter/material.dart';
import 'package:news/data/datasources/news_list_remote_datasource.dart';
import 'package:news/data/models/news_list_model.dart';
import 'package:news/domain/repositories/news_list_repository.dart';

class NewsListRepositoryImpl implements NewsListRepository {
  final NewsListRemoteDataSource newsListRemoteDataSource;

  NewsListRepositoryImpl({required this.newsListRemoteDataSource});

  @override
  Future<List<NewsModel>> fetchNewsList({String? query}) async {
    return await newsListRemoteDataSource.fetchNewsList(query: query);
  }
}
