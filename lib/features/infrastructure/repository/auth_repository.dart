import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trek_high/app/entities/failure.dart';
import 'package:trek_high/features/infrastructure/entities/request/new_signup_request/new_signup_request.dart';
import 'package:trek_high/features/infrastructure/entities/response/new_signup_response/new_signup_response.dart';

final authRepository =
    Provider<IAuthRepository>((ref) => AuthRepository(ref.read));

abstract class IAuthRepository {
  /* logout user */
  Future<Either<Unit, Failure>> logout();

  /* get user token */
  Future<Either<String, Failure>> getToken();

  /* Signup new user */
  Future<Either<SignupResponse, Failure>> signupNewUser(
      {required NewSignupRequest newSignupRequest, required String password});
}

class AuthRepository implements IAuthRepository {
  AuthRepository(Reader read) : _read = read;

  final Reader _read;
  final _dio = Dio();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<Either<Unit, Failure>> logout() {
    throw UnimplementedError();
  }

  @override
  Future<Either<String, Failure>> getToken() {
    throw UnimplementedError();
  }

  @override
  Future<Either<SignupResponse, Failure>> signupNewUser(
      {required NewSignupRequest newSignupRequest,
      required String password}) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: newSignupRequest.email,
        password: password,
      );
      final user = _auth.currentUser;
      newSignupRequest.toJson().removeWhere((key, value) => key == 'password');
      await _firestore.collection('users').doc(user?.uid).set(
            newSignupRequest.toJson(),
          );
      if (user != null && !user.emailVerified) {
        await user.sendEmailVerification();
      }
      return Left(
        SignupResponse(
          email: newSignupRequest.email,
          firstName: newSignupRequest.fullName,
          message: 'Signup successful',
        ),
      );
    } on FirebaseAuthException catch (e) {
      final user = _auth.currentUser;
      await user?.delete();
      return Right(
        Failure(
          errorMessage:
              e.message ?? 'Something went wrong, try in few moments !',
        ),
      );
    } catch (e) {
      final user = _auth.currentUser;
      await user?.delete();
      return Right(
        Failure(
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
