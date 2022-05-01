import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lab3/models/news.dart';
import 'package:lab3/service/news_service.dart';
import 'package:lab3/widget/news_list_widget.dart';

class AllNewsWidget extends StatelessWidget {
  final DateFormat format = DateFormat("yyyy-MM-dd HH:mm:ss");

  AllNewsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: FutureBuilder<List<News>>(
            future: NewsService().listAllNews(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Center(child: CircularProgressIndicator());
              }

              return NewsListWidget(news: snapshot.data!);
            },
          ),
        ),
      ],
    );
  }
}
