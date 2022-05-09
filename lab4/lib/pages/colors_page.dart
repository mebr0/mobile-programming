import 'package:color_picker/pages/cart_page.dart';
import 'package:color_picker/pages/main_page.dart';
import 'package:color_picker/provider/cart_provider.dart';
import 'package:color_picker/provider/colors_provider.dart';
import 'package:color_picker/provider/token_provier.dart';
import 'package:color_picker/widgets/app_bar_widget.dart';
import 'package:color_picker/widgets/colors_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ColorsPage extends ConsumerWidget {
  const ColorsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var colors = ref.read(colorsProvider);
    var cart = ref.watch(cartProvider);

    return Scaffold(
      appBar: MyAppBar(
        title: 'Color Picker',
        leadingIcon: FontAwesomeIcons.userXmark,
        leadingCall: () {
          ref.read(tokenSource.notifier).update("");

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const MainPageWidget(),
            ),
          );
        },
        trailingIcon: FontAwesomeIcons.cartShopping,
        trailingCall: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const CartPage(),
            ),
          );
        },
      ),
      body: ColorsListWidget(
        counter: false,
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
