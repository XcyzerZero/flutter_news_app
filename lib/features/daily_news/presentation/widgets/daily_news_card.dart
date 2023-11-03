import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:news_api_clean/features/daily_news/domain/entities/article_entity.dart';
import 'package:news_api_clean/features/daily_news/presentation/pages/article_page.dart';

class DailyNewsCard extends StatelessWidget {
  final ArticleEntity article;
  const DailyNewsCard({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    DateTime parsedDate = DateTime.parse(article.pubDate!);

    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ArticlePage(article: article),
            ));
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.width / 2.2,
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              color: Colors.grey, // Shadow color
              blurRadius: 10, // Spread radius of the shadow
              offset:
                  Offset(0, 4), // Offset of the shadow (horizontal, vertical)
            ),
          ],
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                width: MediaQuery.of(context).size.width / 3,
                height: double.maxFinite,
                child: Image.network(
                  article.imageUrl!,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 4,
                    child: Text(
                      article.title.toString(),
                      style: const TextStyle(
                        height: 1.3,
                        fontFamily: "Muli",
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        overflow: TextOverflow.clip,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Expanded(
                    flex: 4,
                    child: Text(
                      article.description.toString(),
                      maxLines: 3,
                      style: const TextStyle(
                        fontFamily: "Muli",
                        fontSize: 12,
                        height: 1.3,
                        overflow: TextOverflow.fade,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 6, vertical: 4),
                      decoration: BoxDecoration(
                          color: Colors.redAccent.shade200,
                          borderRadius: BorderRadius.circular(10)),
                      child: Text(
                        DateFormat('MMMM dd, y h:mm a')
                            .format(parsedDate)
                            .toString(),
                        textAlign: TextAlign.start,
                        style: const TextStyle(
                            color: Colors.white,
                            fontFamily: "Muli",
                            fontSize: 12,
                            overflow: TextOverflow.fade,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
