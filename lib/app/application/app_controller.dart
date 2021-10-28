import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trek_high/app/entities/app_state.dart';

///
final appController = StateNotifierProvider<AppStateNotifier, AppState>((ref) {
  return AppStateNotifier(ref.read)..appStarted();
});

///
class AppStateNotifier extends StateNotifier<AppState> {
  ///
  AppStateNotifier(this._read) : super(const AppState<void>.started());

  final Reader _read;

  ///
  Future<void> appStarted() async {
    state = const AppState<dynamic>.unAuthenticated();
  }

  Future<void> unAuthenticated() async {
    // await _read(authRepository).logout();
    state = const AppState<void>.unAuthenticated();
  }

  void updateAppState(AppState<void> appState) {
    state = appState;
  }
}
