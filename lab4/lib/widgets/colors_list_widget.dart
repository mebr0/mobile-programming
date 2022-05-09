import 'package:color_picker/provider/colors_provider.dart';
import 'package:flutter/material.dart';

typedef ColorExists = bool Function(Color clr);
typedef ColorAction = void Function(MyColor clr);

class ColorsListWidget extends StatelessWidget {
  final bool counter;
  final List<MyColor> colors;
  final ColorExists exists;
  final ColorAction action;

  const ColorsListWidget({
    required this.counter,
    required this.colors,
    required this.exists,
    required this.action,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        counter
            ? Container(
                height: 50,
                alignment: Alignment.center,
                child: Text(
                  'Total count: ${colors.length}',
                  style: const TextStyle(
                    fontSize: 30,
                  ),
                ),
              )
            : const SizedBox.shrink(),
        for (final clr in colors)
          ListTile(
            title: Container(
              alignment: Alignment.centerLeft,
              child: Text(clr.name),
            ),
            leading: Container(
              height: 30,
              width: 30,
              color: clr.value,
            ),
            trailing: MaterialButton(
              child: Text(
                exists(clr.value) ? 'Remove' : 'Add',
              ),
              onPressed: () {
                action(clr);
              },
            ),
          ),
      ],
    );
  }
}
