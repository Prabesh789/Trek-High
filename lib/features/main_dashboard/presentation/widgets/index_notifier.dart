import 'package:hooks_riverpod/hooks_riverpod.dart';

final indexNotifierProvider =
    StateNotifierProvider.autoDispose<IndexNotifier, int>((ref) {
  return IndexNotifier();
});

class IndexNotifier extends StateNotifier<int> {
  IndexNotifier() : super(0);
  // ignore: use_setters_to_change_properties
  void changeIndex(int value) {
    state = value;
  }
}
