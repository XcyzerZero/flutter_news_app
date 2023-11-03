part of 'daily_news_bloc.dart';

abstract class DailyNewsEvent extends Equatable {
  const DailyNewsEvent();

  @override
  List<Object> get props => [];
}

class GetDailyNewsEvent extends DailyNewsEvent {}

class GetArticleWithQueryEvent extends DailyNewsEvent {
  final String query;

  const GetArticleWithQueryEvent({required this.query});

  @override
  List<Object> get props => [query];
}
