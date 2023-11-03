import 'package:equatable/equatable.dart';

class ArticleEntity extends Equatable {
  final String? articleId;
  final String? title;
  final String? link;
  final String? description;
  final String? content;
  final String? pubDate;
  final String? imageUrl;

  const ArticleEntity({
    this.articleId,
    this.title,
    this.link,
    this.description,
    this.content,
    this.pubDate,
    this.imageUrl,
  });

  @override
  List<Object?> get props => [
        articleId,
        title,
        link,
        description,
        content,
        pubDate,
        imageUrl,
      ];
}
