import 'dart:io';

import 'package:dio/dio.dart';
import 'package:learn_clean_architecture/cores/constants/constants.dart';
import 'package:learn_clean_architecture/cores/resources/data_state.dart';
import 'package:learn_clean_architecture/features/daily_news/data/data_sources/remote/news_api_service.dart';
import 'package:learn_clean_architecture/features/daily_news/data/models/article.dart';
import 'package:learn_clean_architecture/features/daily_news/domain/repositories/article_repository.dart';

class ArticleRepositoryImpl implements ArticleRepository {
  final NewsApiService _newsApiService;

  ArticleRepositoryImpl(this._newsApiService);

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
}
