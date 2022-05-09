import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final IconData? leadingIcon;
  final VoidCallback? leadingCall;
  final IconData? trailingIcon;
  final VoidCallback? trailingCall;

  const MyAppBar({
    required this.title,
    this.leadingIcon,
    this.leadingCall,
    this.trailingIcon,
    this.trailingCall,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var list = <Widget>[];

    if (trailingIcon != null) {
      list.add(IconButton(
        icon: FaIcon(
          trailingIcon,
          size: 20,
          color: Colors.white,
        ),
        onPressed: trailingCall,
      ));
    }

    return AppBar(
      title: Text(title),
      centerTitle: true,
      leading: leadingIcon != null
          ? IconButton(
              icon: FaIcon(
                leadingIcon,
                size: 20,
                color: Colors.white,
              ),
              onPressed: leadingCall,
            )
          : null,
      actions: list,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50);
}
