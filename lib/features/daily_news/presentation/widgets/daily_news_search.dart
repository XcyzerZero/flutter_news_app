import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_api_clean/features/daily_news/presentation/bloc/daily_news_bloc.dart';
import 'package:news_api_clean/injection_container.dart';

class DailyNewsSearch extends StatelessWidget {
  const DailyNewsSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DailyNewsBloc>(
      create: (context) => sl<DailyNewsBloc>(),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              color: Colors.grey, // Shadow color
              blurRadius: 5, // Spread radius of the shadow
              offset:
                  Offset(1, 2), // Offset of the shadow (horizontal, vertical)
            ),
          ],
        ),
        margin: const EdgeInsets.only(right: 12),
        height: 40,
        width: MediaQuery.of(context).size.width / 2,
        child: TextField(
          onSubmitted: (searchQuery) {
            BlocProvider.of<DailyNewsBloc>(context)
                .add(GetArticleWithQueryEvent(query: searchQuery));
          },
          decoration: const InputDecoration(
              contentPadding: EdgeInsets.only(
                top: 0,
                right: 4,
                left: 4,
                bottom: 4,
              ),
              prefixIcon: Icon(Icons.search),
              border: InputBorder.none),
          style: const TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, fontFamily: "Muli"),
        ),
      ),
    );
  }
}
