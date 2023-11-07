import 'package:articles_test/presentation/controller/news_controller.dart';
import 'package:get_it/get_it.dart';

import '../../data/datasource/news_remote_data_source.dart';
import '../../data/repository/news_rempository.dart';
import '../../domain/repository/base_news_repository.dart';
import '../../domain/usecase/get_apple_articles_usecase.dart';

final sl = GetIt.instance;

class ServicesLocator {
  static void init() {
    sl.registerFactory(() => NewsController());

    sl.registerLazySingleton(() => GetArticlesUseCase(sl()));

    sl.registerLazySingleton<BaseNewsRepository>(() => NewsRepository(sl()));

    sl.registerLazySingleton<BaseNewsRemoteDataSource>(
        () => NewsRemoteDataSource());
  }
}
