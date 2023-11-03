import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_api_clean/features/daily_news/presentation/bloc/daily_news_bloc.dart';

import 'package:news_api_clean/features/daily_news/presentation/widgets/daily_news_card.dart';
import 'package:news_api_clean/features/daily_news/presentation/widgets/daily_news_search.dart';
import 'package:news_api_clean/injection_container.dart';

class DailyNewsPage extends StatelessWidget {
  const DailyNewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DailyNewsBloc>(
      create: (context) => sl()..add(GetDailyNewsEvent()),
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 60,
          title: const Text("Latest News"),
          actions: const [
            DailyNewsSearch(),
          ],
        ),
        body: BlocBuilder<DailyNewsBloc, DailyNewsState>(
          builder: (_, state) {
            if (state is DailyNewsLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is DailyNewsLoaded) {
              return ListView.builder(
                itemCount: state.article!.length,
                itemBuilder: (BuildContext context, int index) {
                  return DailyNewsCard(
                    article: state.article![index],
                  );
                },
              );
            } else if (state is DailyNewsFailed) {
              return Center(
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(22),
                      color: Colors.grey),
                  child: Text(
                    state.error.toString(),
                    style: const TextStyle(
                        fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ),
              );
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}
