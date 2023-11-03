// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'daily_news_bloc.dart';

abstract class DailyNewsState extends Equatable {
  final List<ArticleEntity>? article;
  final String? error;

  const DailyNewsState({
    this.article,
    this.error,
  });

  @override
  List<Object> get props => [article!, error!];
}

class DailyNewsLoading extends DailyNewsState {
  const DailyNewsLoading();
}

class DailyNewsLoaded extends DailyNewsState {
  const DailyNewsLoaded(List<ArticleEntity> article) : super(article: article);
}

class DailyNewsFailed extends DailyNewsState {
  const DailyNewsFailed(String error) : super(error: error);
}
