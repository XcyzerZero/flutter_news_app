import 'dart:core';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:news_api_clean/core/resources/failure.dart';
import 'package:news_api_clean/features/daily_news/data/datasources/remote/news_api_service.dart';
import 'package:news_api_clean/features/daily_news/data/models/article_model.dart';
import 'package:news_api_clean/features/daily_news/domain/entities/article_entity.dart';
import 'package:news_api_clean/features/daily_news/domain/repositories/article_repository.dart';

class ArticleRepositoryImpl implements ArticleRepository {
  final ArticleRemoteDataSource _articleRemoteDataSource;
  ArticleRepositoryImpl(this._articleRemoteDataSource);
  @override
  Future<Either<Failure, List<ArticleModel>>>
      getArticlesFromDataSource() async {
    try {
      final result = await _articleRemoteDataSource.getArticlesFromDataSource();
      return right(result);
    } on DioException catch (e) {
      return left(DioFailure(error: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ArticleEntity>>>
      getArticlesWithQueryFromDataSource(String query) async {
    try {
      final result = await _articleRemoteDataSource
          .getArticlesWithQueryFromDataSource(query);
      return right(result);
    } on DioException catch (e) {
      return left(DioFailure(error: e.toString()));
    }
  }
}
