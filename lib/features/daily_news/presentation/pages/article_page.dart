import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:news_api_clean/features/daily_news/domain/entities/article_entity.dart';

class ArticlePage extends StatelessWidget {
  final ArticleEntity article;
  const ArticlePage({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    DateTime parsedDate = DateTime.parse(article.pubDate!);
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            expandedHeight: 300.0,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                article.imageUrl!,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    dateContainer(parsedDate),
                    const SizedBox(
                      height: 8,
                    ),
                    titleText(article.title!),
                    const SizedBox(
                      height: 24,
                    ),
                    Text(
                      article.content.toString(),
                      style: const TextStyle(
                          height: 1,
                          fontFamily: "Muli",
                          fontSize: 24,
                          fontWeight: FontWeight.w300),
                    ),
                    const SizedBox(height: 6),
                    const Text(
                      "For More Content Visit:",
                      style: TextStyle(
                        height: 1,
                        fontFamily: "Muli",
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      article.link!,
                      style: const TextStyle(
                        color: Colors.blue,
                        decorationColor: Colors.blue,
                        decoration: TextDecoration.underline,
                        height: 1,
                        fontFamily: "Muli",
                        fontSize: 24,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Container dateContainer(DateTime parsedDate) {
  return Container(
    margin: const EdgeInsets.only(bottom: 4),
    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
    decoration: BoxDecoration(
        color: Colors.redAccent.shade200,
        borderRadius: BorderRadius.circular(10)),
    child: Text(
      DateFormat('MMMM dd, y h:mm a').format(parsedDate).toString(),
      textAlign: TextAlign.start,
      style: const TextStyle(
          color: Colors.white,
          fontFamily: "Muli",
          fontSize: 16,
          overflow: TextOverflow.fade,
          fontWeight: FontWeight.w700),
    ),
  );
}

Text titleText(String? title) {
  return Text(
    title!.toString(),
    style: const TextStyle(
      fontFamily: "Muli",
      height: 1,
      fontSize: 32,
      fontWeight: FontWeight.w700,
    ),
  );
}

Text descriptionText(String? description) {
  return Text(
    description!.toString(),
    style: const TextStyle(
      height: 1,
      fontFamily: "Muli",
      fontSize: 28,
    ),
  );
}
