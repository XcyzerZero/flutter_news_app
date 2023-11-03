import 'package:equatable/equatable.dart';
import 'package:news_api_clean/core/constants/api_constants.dart';
import 'package:news_api_clean/features/daily_news/domain/entities/article_entity.dart';

class ArticleModel extends ArticleEntity with EquatableMixin {
  ArticleModel({
    String? articleId,
    String? title,
    String? link,
    String? description,
    String? content,
    String? pubDate,
    String? imageUrl,
  }) : super(
          articleId: articleId,
          title: title,
          link: link,
          description: description,
          content: content,
          pubDate: pubDate,
          imageUrl: imageUrl,
        );

  factory ArticleModel.fromJson(Map<String, dynamic> json) {
    return ArticleModel(
      articleId: json["article_id"] ?? "",
      title: json['title'] ?? "",
      link: json["link"] ?? "",
      description: json['description'] ?? "",
      content: json['content'] ?? "",
      pubDate: json['pubDate'] ?? DateTime.now().toString(),
      imageUrl: json['image_url'] ?? nullImageUrl,
    );
  }
}
