import 'package:hooks_riverpod/hooks_riverpod.dart';

class TokenSource extends StateNotifier<String> {
  TokenSource() : super("");

  void update(String value) => state = value;
  bool empty() => state.isEmpty;
}

final tokenSource = StateNotifierProvider<TokenSource, String>((ref) {
  return TokenSource();
});
