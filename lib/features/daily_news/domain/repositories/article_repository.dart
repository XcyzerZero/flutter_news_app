import 'package:dartz/dartz.dart';
import 'package:news_api_clean/core/resources/failure.dart';
import 'package:news_api_clean/features/daily_news/domain/entities/article_entity.dart';

abstract class ArticleRepository {
  Future<Either<Failure, List<ArticleEntity>>> getArticlesFromDataSource();

  Future<Either<Failure, List<ArticleEntity>>>
      getArticlesWithQueryFromDataSource(String query);
}
