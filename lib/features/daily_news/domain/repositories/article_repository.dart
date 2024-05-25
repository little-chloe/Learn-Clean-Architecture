import 'package:learn_clean_architecture/cores/resources/data_state.dart';
import 'package:learn_clean_architecture/features/daily_news/domain/entities/article.dart';

abstract class ArticleRepository {
  Future<DataState<List<ArticleEntity>>> getNewsArticles();
}
