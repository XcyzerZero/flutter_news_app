import 'package:news_api_clean/core/constants/api_constants.dart';
import 'package:news_api_clean/core/resources/failure.dart';
import 'package:news_api_clean/features/daily_news/data/models/article_model.dart';
import 'package:dio/dio.dart';

abstract class ArticleRemoteDataSource {
  /// requests a random advice from an API
  /// returns [AdviceModel] if Successful
  /// throws and server - exception if status code is not 200
  Future<List<ArticleModel>> getArticlesFromDataSource();
  Future<List<ArticleModel>> getArticlesWithQueryFromDataSource(String query);
}

class ArticleRemoteDataSourceImpl implements ArticleRemoteDataSource {
  final Dio dio;
  ArticleRemoteDataSourceImpl({required this.dio});

  @override
  Future<List<ArticleModel>> getArticlesFromDataSource() async {
    final response = await dio
        .get("$newsAPIBaseUrl/news?apiKey=$newsApiKey&language=$language");
    if (response.statusCode != 200) {
      throw ServerFailure();
    } else {
      final List<ArticleModel> articles =
          List<Map<String, dynamic>>.from(response.data['results'])
              .map((map) => ArticleModel.fromJson(map))
              .toList();
      return articles;
    }
  }

  @override
  Future<List<ArticleModel>> getArticlesWithQueryFromDataSource(
      String query) async {
    final response = await dio.get(
        "$newsAPIBaseUrl/news?apiKey=$newsApiKey&q=$query&language=$language");
    if (response.statusCode != 200) {
      throw ServerFailure();
    } else {
      final List<ArticleModel> articles =
          List<Map<String, dynamic>>.from(response.data['results'])
              .map((map) => ArticleModel.fromJson(map))
              .toList();
      print(articles);
      return articles;
    }
  }
}
