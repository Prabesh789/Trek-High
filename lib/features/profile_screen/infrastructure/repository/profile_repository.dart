import 'package:dartz/dartz.dart';
import 'package:trek_high/app/entities/failure.dart';
import 'package:trek_high/features/auth/infrastructure/entities/request/new_signup_request/new_signup_request.dart';
import 'package:trek_high/features/auth/infrastructure/entities/response/new_signup_response/new_signup_response.dart';

abstract class IProfileRepository {
  /* Signup new user */
  Future<Either<SignupResponse, Failure>> userProfileDetail(
      {required NewSignupRequest newSignupRequest, required String password});
}
