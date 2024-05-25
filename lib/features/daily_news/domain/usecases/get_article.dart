import 'package:learn_clean_architecture/cores/resources/data_state.dart';
import 'package:learn_clean_architecture/cores/usecases/usecase.dart';
import 'package:learn_clean_architecture/features/daily_news/domain/entities/article.dart';
import 'package:learn_clean_architecture/features/daily_news/domain/repositories/article_repository.dart';

class GetArticleUsecase
    implements UseCase<DataState<List<ArticleEntity>>, void> {
  final ArticleRepository _articleRepository;

  GetArticleUsecase(this._articleRepository);

  @override
  Future<DataState<List<ArticleEntity>>> call({void params}) {
    return _articleRepository.getNewsArticles();
  }
}
