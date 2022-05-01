import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lab3/models/news.dart';
import 'package:lab3/service/news_service.dart';
import 'package:lab3/widget/news_list_widget.dart';

class CategoryNewsWidget extends StatefulWidget {
  const CategoryNewsWidget({Key? key}) : super(key: key);

  @override
  State<CategoryNewsWidget> createState() => _CategoryNewsWidgetState();
}

class _CategoryNewsWidgetState extends State<CategoryNewsWidget> {
  final DateFormat format = DateFormat("yyyy-MM-dd HH:mm:ss");
  final List<String> categories = <String>[
    "business", "entertainment", "general", "health", "science", "sports",
    "technology"
  ];

  late String category;

  _CategoryNewsWidgetState() {
    category = categories[0];
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:  Column(
        children: [
          DropdownButton<String>(
            value: category,
            elevation: 16,
            alignment: AlignmentDirectional.center,
            underline: Container(
              height: 2,
              color: Colors.blue,
            ),
            onChanged: (String? newValue) {
              setState(() {
                category = newValue!;
              });
            },
            items: categories.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: FutureBuilder<List<News>>(
              future: NewsService().listNewsByCategory(category),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(child: CircularProgressIndicator());
                }

                return NewsListWidget(news: snapshot.data!);
              },
            ),
          ),
        ],
      ),
    );
  }
}
