import 'package:learn_clean_architecture/cores/usecases/usecase.dart';
import 'package:learn_clean_architecture/features/daily_news/domain/entities/article.dart';
import 'package:learn_clean_architecture/features/daily_news/domain/repositories/article_repository.dart';

class RemoveArticlesUseCase implements UseCase<void, ArticleEntity> {
  final ArticleRepository _articleRepository;

  RemoveArticlesUseCase(this._articleRepository);

  @override
  Future<void> call({ArticleEntity? params}) {
    return _articleRepository.removeArticle(params!);
  }
}
