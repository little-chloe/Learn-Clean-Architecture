import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_clean_architecture/cores/resources/data_state.dart';
import 'package:learn_clean_architecture/features/daily_news/domain/usecases/get_article.dart';
import 'package:learn_clean_architecture/features/daily_news/presentation/blocs/article/remote/remote_article_event.dart';
import 'package:learn_clean_architecture/features/daily_news/presentation/blocs/article/remote/remote_article_state.dart';

class RenmoteArticleBloc extends Bloc<RemoteArticleEvent, RemoteArticleState> {
  final GetArticleUsecase _getArticleUsecase;

  RenmoteArticleBloc(this._getArticleUsecase)
      : super(const RemoteArticleLoading()) {
    on<GetArticles>(onGetArticle);
  }

  void onGetArticle(GetArticles event, Emitter<RemoteArticleState> emit) async {
    final dataState = await _getArticleUsecase();

    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      emit(RemoteArticleDone(dataState.data!));
    }

    if (dataState is DataFailed) {
      print(dataState.error!.message);
      emit(RemoteArticleError(dataState.error!));
    }
  }
}
