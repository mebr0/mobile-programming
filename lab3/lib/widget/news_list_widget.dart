import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lab3/models/news.dart';
import 'package:lab3/page/news_detail_page.dart';

class NewsListWidget extends StatelessWidget {
  final DateFormat format = DateFormat("yyyy-MM-dd HH:mm:ss");

  final List<News> news;

  NewsListWidget({
    required this.news,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: news.length,
      itemBuilder: (context, index) {
        return ListTile(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => NewsDetailPage(news: news[index])
              ),
            );
          },
          title: Text(
            news[index].title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          subtitle: Text(
            news[index].description,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
          trailing: Text(
            format.format(news[index].publishedAt),
            maxLines: 1,
          ),
        );
      },
    );
  }
}
