import 'package:color_picker/provider/colors_provider.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CartNotifier extends ChangeNotifier {
  final colors = <MyColor>[];

  void add(MyColor clr) {
    colors.add(clr);
    notifyListeners();
  }

  void remove(Color value) {
    colors.remove(colors.firstWhere((element) => element.value == value));
    notifyListeners();
  }

  bool exists(Color value) {
    for (final clr in colors) {
      if (clr.value == value) {
        return true;
      }
    }

    return false;
  }
}

final cartProvider = ChangeNotifierProvider<CartNotifier>((ref) {
  return CartNotifier();
});
