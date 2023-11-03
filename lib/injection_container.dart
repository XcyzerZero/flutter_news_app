import "package:dio/dio.dart";
import "package:get_it/get_it.dart";
import "package:news_api_clean/features/daily_news/data/datasources/remote/news_api_service.dart";
import "package:news_api_clean/features/daily_news/data/repositories/article_repository.dart";
import "package:news_api_clean/features/daily_news/domain/repositories/article_repository.dart";
import "package:news_api_clean/features/daily_news/domain/usecases/get_article_usecase.dart";
import "package:news_api_clean/features/daily_news/presentation/bloc/daily_news_bloc.dart";

final sl = GetIt.I;

Future<void> init() async {
  sl.registerSingleton<Dio>(Dio());
  sl.registerSingleton<ArticleRemoteDataSource>(
      ArticleRemoteDataSourceImpl(dio: sl()));
  sl.registerSingleton<ArticleRepository>(ArticleRepositoryImpl(sl()));
  sl.registerSingleton<GetArticleUseCase>(GetArticleUseCase(articleRepo: sl()));
  sl.registerFactory<DailyNewsBloc>(() => DailyNewsBloc(sl()));
}
