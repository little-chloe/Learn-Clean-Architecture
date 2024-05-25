import 'dart:io';

import 'package:dio/dio.dart';
import 'package:learn_clean_architecture/cores/constants/constants.dart';
import 'package:learn_clean_architecture/cores/resources/data_state.dart';
import 'package:learn_clean_architecture/features/daily_news/data/data_sources/local/app_database.dart';
import 'package:learn_clean_architecture/features/daily_news/data/data_sources/remote/news_api_service.dart';
import 'package:learn_clean_architecture/features/daily_news/data/models/article.dart';
import 'package:learn_clean_architecture/features/daily_news/domain/entities/article.dart';
import 'package:learn_clean_architecture/features/daily_news/domain/repositories/article_repository.dart';

class ArticleRepositoryImpl implements ArticleRepository {
  final NewsApiService _newsApiService;
  final AppDatabase _appDatabase;

  ArticleRepositoryImpl(this._newsApiService, this._appDatabase);

  @override
  Future<DataState<List<ArticleModel>>> getNewsArticles() async {
    try {
      final httpResponse = await _newsApiService.getNewsArticles(
        apiKey: newsAPIKey,
        category: categoryQuery,
        country: countryQuery,
      );

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
        return DataFailed(DioException(
          error: httpResponse.response.statusMessage,
          response: httpResponse.response,
          requestOptions: httpResponse.response.requestOptions,
        ));
      }
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }

  @override
  Future<List<ArticleEntity>> getSavedArticles() {
    return _appDatabase.articleDao.getArticles();
  }

  @override
  Future<void> removeArticle(ArticleEntity article) {
    return _appDatabase.articleDao
        .deleteArticle(ArticleModel.fromEntity(article));
  }

  @override
  Future<void> saveArticle(ArticleEntity article) {
    return _appDatabase.articleDao
        .insertArticle(ArticleModel.fromEntity(article));
  }
}
