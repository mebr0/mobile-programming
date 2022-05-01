import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final IconButton? leftButton;

  const AppBarWidget({
    this.leftButton,
    Key? key,
  }) : super(key: key);

  factory AppBarWidget.withBackButton(BuildContext context) {
    return AppBarWidget(
      leftButton: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (leftButton != null) {
      return AppBar(
        title: const Text("News"),
        centerTitle: true,
      );
    }

    return AppBar(
      title: const Text("News"),
      centerTitle: true,
      leading: leftButton,
    );
  }

  @override
  final Size preferredSize = const Size.fromHeight(50.0);
}
