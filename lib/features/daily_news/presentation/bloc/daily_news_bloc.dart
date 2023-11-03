import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_api_clean/features/daily_news/domain/entities/article_entity.dart';
import 'package:news_api_clean/features/daily_news/domain/usecases/get_article_usecase.dart';

part 'daily_news_event.dart';
part 'daily_news_state.dart';

class DailyNewsBloc extends Bloc<DailyNewsEvent, DailyNewsState> {
  final GetArticleUseCase _getArticleUseCase;
  DailyNewsBloc(this._getArticleUseCase) : super(const DailyNewsLoading()) {
    on<GetDailyNewsEvent>(_getDailyNewsEvent);
    on<GetArticleWithQueryEvent>(_getArticleWithQueryEvent);
  }

  void _getDailyNewsEvent(
      GetDailyNewsEvent event, Emitter<DailyNewsState> emit) async {
    emit(const DailyNewsLoading());
    final failureOrEntity = await _getArticleUseCase.getArticles();
    failureOrEntity.fold(
      (failure) => emit(DailyNewsFailed(failure.toString())),
      (success) => emit(DailyNewsLoaded(success)),
    );
  }

  void _getArticleWithQueryEvent(
      GetArticleWithQueryEvent event, Emitter<DailyNewsState> emit) async {
    emit(const DailyNewsLoading());
    final failureOrEntity =
        await _getArticleUseCase.getArticlesWithQuery(event.query);
    failureOrEntity.fold(
      (failure) => emit(DailyNewsFailed(failure.toString())),
      (success) => emit(DailyNewsLoaded(success)),
    );
  }
}
