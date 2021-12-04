import 'dart:io';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trek_high/app/entities/failure.dart';
import 'package:trek_high/core/entities/base_state.dart';
import 'package:trek_high/features/auth/infrastructure/entities/request/login_request/login_request.dart';
import 'package:trek_high/features/auth/infrastructure/entities/request/new_signup_request/new_signup_request.dart';
import 'package:trek_high/features/auth/infrastructure/entities/response/new_signup_response/new_signup_response.dart';
import 'package:trek_high/features/auth/infrastructure/entities/response/user_response/user_response.dart';
import 'package:trek_high/features/auth/infrastructure/repository/auth_repository.dart';
import 'package:uuid/uuid.dart';

AuthController<T> authController<T>(ProviderReference ref) {
  return AuthController<T>(
    ref.read,
  );
}

final userIdProvider = StateProvider<String>(
  (ref) {
    return '';
  },
);

class AuthController<T> extends StateNotifier<BaseState> {
  AuthController(
    this._read,
  ) : super(const BaseState<void>.initial());

  final Reader _read;
  Uuid uuid = const Uuid();
  IAuthRepository get _repo => _read(authRepository);

  Future<void> signupUser({
    required String fullName,
    required String email,
    required String password,
    required String contact,
    required String address,
    File? image,
    String? aboutYou,
    required bool admin,
  }) async {
    state = const BaseState<void>.loading();

    final requestData = NewSignupRequest(
      fullName: fullName,
      contact: contact,
      address: address,
      email: email,
      deviceId: uuid.v1(),
      // emailVerified: false,
      password: password,
      image: image,
      platform: Platform.isAndroid ? 1 : 2,
      aboutYou: aboutYou,
      admin: admin,
    );
    final response = await _repo.signupNewUser(
      newSignupRequest: requestData,
      password: password,
    );
    state = response.fold(
      (success) => BaseState<SignupResponse>.success(data: success),
      (error) => BaseState<Failure>.error(error),
    );
  }

  Future<void> loginUser({required LoginRequest loginRequest}) async {
    state = const BaseState<void>.loading();

    final requestData = LoginRequest(
      email: loginRequest.email,
      password: loginRequest.password,
      platform: Platform.isAndroid ? 1 : 2,
      latitude: loginRequest.latitude,
      longitude: loginRequest.longitude,
    );
    final response = await _repo.loginUser(loginRequest: requestData);
    state = response.fold(
      (success) {
        _read(userIdProvider).state = success.userId;
        return BaseState<UserResponse>.success(data: success);
      },
      (error) => BaseState<Failure>.error(error),
    );
  }
}
