import 'package:flutter/material.dart';
import 'package:lab3/widget/all_news_widget.dart';
import 'package:lab3/widget/app_bar_widget.dart';
import 'package:lab3/widget/category_news_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _index = 0;

  final List<Widget> _pages = [
    AllNewsWidget(),
    const CategoryNewsWidget(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(),
      body: Center(child: _pages.elementAt(_index)),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.newspaper),
            label: "all",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.newspaper_sharp),
            label: "by category",
          ),
        ],
        currentIndex: _index,
        onTap: (index) {
          setState(() {
            _index = index;
          });
        },
      ),
    );
  }
}
