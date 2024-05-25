import 'package:learn_clean_architecture/cores/usecases/usecase.dart';
import 'package:learn_clean_architecture/features/daily_news/domain/entities/article.dart';
import 'package:learn_clean_architecture/features/daily_news/domain/repositories/article_repository.dart';

class SaveArticlesUseCase implements UseCase<void, ArticleEntity> {
  final ArticleRepository _articleRepository;

  SaveArticlesUseCase(this._articleRepository);

  @override
  Future<void> call({ArticleEntity? params}) {
    return _articleRepository.saveArticle(params!);
  }
}
