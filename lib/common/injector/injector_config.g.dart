// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'injector_config.dart';

// **************************************************************************
// KiwiInjectorGenerator
// **************************************************************************

class _$Injector extends Injector {
  @override
  void blocs() {
    final KiwiContainer container = KiwiContainer();
    container.registerFactory(
        (c) => NewsListBloc(newsListUseCase: c<NewsListUseCase>()));
  }

  @override
  void useCases() {
    final KiwiContainer container = KiwiContainer();
    container.registerSingleton(
        (c) => NewsListUseCase(newsListRepository: c<NewsListRepository>()));
  }

  @override
  void repositories() {
    final KiwiContainer container = KiwiContainer();
    container.registerSingleton<NewsListRepository>((c) =>
        NewsListRepositoryImpl(
            newsListRemoteDataSource: c<NewsListRemoteDataSource>()));
  }

  @override
  void remoteDataSources() {
    final KiwiContainer container = KiwiContainer();
    container.registerSingleton((c) => NewsListRemoteDataSource());
  }
}
