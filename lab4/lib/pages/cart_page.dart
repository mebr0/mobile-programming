import 'package:color_picker/provider/cart_provider.dart';
import 'package:color_picker/widgets/app_bar_widget.dart';
import 'package:color_picker/widgets/colors_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CartPage extends ConsumerWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var cart = ref.watch(cartProvider);
    var colors = cart.colors;

    return Scaffold(
      appBar: MyAppBar(
        title: 'Cart',
        leadingIcon: FontAwesomeIcons.arrowLeftLong,
        leadingCall: () {
          Navigator.pop(context);
        },
      ),
      body: ColorsListWidget(
        counter: true,
        colors: colors,
        exists: (clr) {
          return cart.exists(clr);
        },
        action: (clr) {
          cart.exists(clr.value) ? cart.remove(clr.value) : cart.add(clr);
        },
      ),
    );
  }
}
