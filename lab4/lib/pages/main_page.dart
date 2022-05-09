import 'package:color_picker/pages/colors_page.dart';
import 'package:color_picker/pages/login_page.dart';
import 'package:color_picker/provider/token_provier.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MainPageWidget extends HookConsumerWidget {
  const MainPageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool auth = !ref.watch(tokenSource.notifier).empty();

    return auth ? const ColorsPage() : const LoginPage();
  }
}
