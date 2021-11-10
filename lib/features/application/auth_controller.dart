import 'dart:io';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trek_high/app/application/app_controller.dart';
import 'package:trek_high/app/entities/failure.dart';
import 'package:trek_high/app_setup/local_database/local_data_source.dart';
import 'package:trek_high/core/entities/base_state.dart';
import 'package:trek_high/features/infrastructure/entities/request/new_signup_request/new_signup_request.dart';
import 'package:trek_high/features/infrastructure/entities/response/new_signup_response/new_signup_response.dart';
import 'package:trek_high/features/infrastructure/repository/auth_repository.dart';
import 'package:uuid/uuid.dart';

AuthController<T> authController<T>(ProviderReference ref) {
  return AuthController<T>(
    ref.read,
  );
}

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
  }) async {
    state = const BaseState<void>.loading();

    final requestData = NewSignupRequest(
      fullName: fullName,
      contact: contact,
      address: address,
      email: email,
      deviceId: uuid.v1(),
      emailVerified: false,
      password: password,
      image: image,
      platform: Platform.isAndroid ? 1 : 2,
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
}
