import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_clean_architecture/features/daily_news/domain/usecases/get_saved_articles.dart';
import 'package:learn_clean_architecture/features/daily_news/domain/usecases/remove_article.dart';
import 'package:learn_clean_architecture/features/daily_news/domain/usecases/save_article.dart';
import 'package:learn_clean_architecture/features/daily_news/presentation/blocs/article/local/local_article_event.dart';
import 'package:learn_clean_architecture/features/daily_news/presentation/blocs/article/local/local_article_state.dart';

class LocalArticleBloc extends Bloc<LocalArticleEvent, LocalArticlesState> {
  final GetSavedArticlesUseCase _getSavedArticlesUseCase;
  final SaveArticlesUseCase _saveArticlesUseCase;
  final RemoveArticlesUseCase _removeArticlesUseCase;

  LocalArticleBloc(this._getSavedArticlesUseCase, this._saveArticlesUseCase,
      this._removeArticlesUseCase)
      : super(const LocalArticlesLoading()) {
    on<GetSavedArticle>(onGetSavedArticles);
    on<RemoveArticle>(onRemoveArticle);
    on<SaveArticle>(onSaveArticle);
  }

  void onGetSavedArticles(
      GetSavedArticle event, Emitter<LocalArticlesState> emit) async {
    final articles = await _getSavedArticlesUseCase();
    emit(LocalArticlesDone(articles));
  }

  void onRemoveArticle(
      RemoveArticle removeArticle, Emitter<LocalArticlesState> emit) async {
    await _removeArticlesUseCase(params: removeArticle.article);
    final articles = await _getSavedArticlesUseCase();
    emit(LocalArticlesDone(articles));
  }

  void onSaveArticle(
      SaveArticle saveArticle, Emitter<LocalArticlesState> emit) async {
    await _saveArticlesUseCase(params: saveArticle.article);
    final articles = await _getSavedArticlesUseCase();
    emit(LocalArticlesDone(articles));
  }
}
