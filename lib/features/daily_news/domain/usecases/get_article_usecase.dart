import 'package:dartz/dartz.dart';
import 'package:news_api_clean/core/resources/failure.dart';
import 'package:news_api_clean/features/daily_news/domain/entities/article_entity.dart';
import 'package:news_api_clean/features/daily_news/domain/repositories/article_repository.dart';

class GetArticleUseCase {
  final ArticleRepository articleRepo;

  GetArticleUseCase({required this.articleRepo});

  Future<Either<Failure, List<ArticleEntity>>> getArticles() {
    return articleRepo.getArticlesFromDataSource();
  }

  Future<Either<Failure, List<ArticleEntity>>> getArticlesWithQuery(
      String query) {
    return articleRepo.getArticlesWithQueryFromDataSource(query);
  }
}
