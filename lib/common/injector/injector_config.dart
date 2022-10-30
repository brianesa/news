import 'package:kiwi/kiwi.dart';
import 'package:news/data/datasources/news_list_remote_datasource.dart';
import 'package:news/data/repositories/news_list_repository_impl.dart';
import 'package:news/domain/repositories/news_list_repository.dart';
import 'package:news/domain/usecases/news_list_usecase.dart';
import 'package:news/presentation/journey/news_list/bloc/news_list_bloc.dart';

part 'injector_config.g.dart';

abstract class Injector {
  static void setup() {
    final injector = _$Injector();
    // ignore: cascade_invocations
    injector._configure();
  }

  void _configure() {
    blocs();
    useCases();
    repositories();
    remoteDataSources();
  }

  @Register.factory(NewsListBloc)
  void blocs();

  @Register.singleton(NewsListUseCase)
  void useCases();

  @Register.singleton(NewsListRepository)
  void repositories();

  @Register.singleton(NewsListRemoteDataSource)
  void remoteDataSources();
}
