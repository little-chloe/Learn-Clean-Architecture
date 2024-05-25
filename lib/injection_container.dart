import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:learn_clean_architecture/features/daily_news/data/data_sources/local/app_database.dart';
import 'package:learn_clean_architecture/features/daily_news/data/data_sources/remote/news_api_service.dart';
import 'package:learn_clean_architecture/features/daily_news/data/repositories/article_repository.dart';
import 'package:learn_clean_architecture/features/daily_news/domain/repositories/article_repository.dart';
import 'package:learn_clean_architecture/features/daily_news/domain/usecases/get_article.dart';
import 'package:learn_clean_architecture/features/daily_news/presentation/blocs/article/remote/remote_article_bloc.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  final database =
      await $FloorAppDatabase.databaseBuilder('app_database.db').build();

  sl.registerSingleton<AppDatabase>(database);

  // Dio
  sl.registerSingleton<Dio>(Dio());

  // dependencies
  sl.registerSingleton<NewsApiService>(NewsApiService(sl()));

  sl.registerSingleton<ArticleRepository>(ArticleRepositoryImpl(sl()));

  // usecases
  sl.registerSingleton<GetArticleUsecase>(GetArticleUsecase(sl()));

  // blocs
  sl.registerFactory<RenmoteArticleBloc>(() => RenmoteArticleBloc(sl()));
}
