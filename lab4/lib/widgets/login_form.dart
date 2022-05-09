import 'package:color_picker/pages/main_page.dart';
import 'package:color_picker/provider/token_provier.dart';
import 'package:color_picker/services/store_api.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter/material.dart';

class SignInWidget extends ConsumerWidget {
  final _formKey = GlobalKey<FormBuilderState>();

  SignInWidget({Key? key}) : super(key: key);

  Future<String> obtainToken() async {
    var fields = _formKey.currentState!.value;

    var username = fields["username"];
    var password = fields["password"];

    return StoreAPI().getToken(username, password);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Size size = MediaQuery.of(context).size;

    return FormBuilder(
      key: _formKey,
      autovalidateMode: AutovalidateMode.always,
      child: Container(
        width: 0.8 * size.width,
        padding: const EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 10,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 100,
              margin: const EdgeInsets.all(10),
              alignment: Alignment.center,
              child: const Text(
                'Sign In',
                style: TextStyle(fontSize: 28),
              ),
            ),
            Container(
              width: 250,
              margin: const EdgeInsets.all(10),
              child: FormBuilderTextField(
                name: 'username',
                initialValue: 'mor_2314',
                decoration: const InputDecoration(labelText: 'username'),
                keyboardType: TextInputType.text,
              ),
            ),
            Container(
              width: 250,
              margin: const EdgeInsets.all(10),
              child: FormBuilderTextField(
                name: 'password',
                initialValue: '83r5^_',
                decoration: const InputDecoration(labelText: 'password'),
                keyboardType: TextInputType.text,
                obscureText: true,
              ),
            ),
            SizedBox(
              width: 80,
              child: MaterialButton(
                color: Theme.of(context).primaryColor,
                child: const Text(
                  "Submit",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () async {
                  _formKey.currentState!.save();
                  if (!_formKey.currentState!.validate()) {
                    print("validation failed");
                    return;
                  }

                  String token = await obtainToken();

                  if (token.isEmpty) {
                    print("invalid username");
                    return;
                  }

                  ref.read(tokenSource.notifier).update(token);

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MainPageWidget(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
