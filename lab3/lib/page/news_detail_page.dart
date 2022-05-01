import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lab3/models/news.dart';
import 'package:lab3/widget/app_bar_widget.dart';

class NewsDetailPage extends StatelessWidget {
  final DateFormat format = DateFormat("yyyy-MM-dd HH:mm:ss");

  final News news;

  NewsDetailPage({
    required this.news,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget.withBackButton(context),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              news.title,
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 26),
            ),
            const SizedBox(height: 5),
            Text(
              format.format(news.publishedAt),
              maxLines: 1,
              style: const TextStyle(
                fontSize: 12,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              news.description,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
