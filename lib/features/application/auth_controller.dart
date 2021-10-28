// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:trek_high/app/application/app_controller.dart';
// import 'package:trek_high/features/infrastructure/repository/auth_repository.dart';

// AuthController<T> authController<T>(ProviderReference ref) {
//   return AuthController<T>(
//     ref.read,
//   );
// }

// class AuthController<T> extends StateNotifier<BaseState> {
//   AuthController(
//     this._read,
//   ) : super(const BaseState<void>.initial());

//   final Reader _read;
//   var uuid = const Uuid();
//   IAuthRepository get _repo => _read(authRepository);
//   AppStateNotifier get _appState => _read(appController.notifier);
//   LocalDataSource get _localDataSource => _read(localDataSource);
// }
