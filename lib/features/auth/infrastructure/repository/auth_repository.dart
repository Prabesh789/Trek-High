import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart' as path;
import 'package:trek_high/app/entities/failure.dart';
import 'package:trek_high/features/auth/infrastructure/entities/request/login_request/login_request.dart';
import 'package:trek_high/features/auth/infrastructure/entities/request/new_signup_request/new_signup_request.dart';
import 'package:trek_high/features/auth/infrastructure/entities/response/country_list_response/country_list_response.dart';
import 'package:trek_high/features/auth/infrastructure/entities/response/new_signup_response/new_signup_response.dart';
import 'package:trek_high/features/auth/infrastructure/entities/response/user_response/user_response.dart';

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

  /* Signup new user */
  Future<Either<UserResponse, Failure>> loginUser({
    required LoginRequest loginRequest,
  });
  /* country list */
  Future<Either<CountryListResponse, Failure>> countryNameList();
}

class AuthRepository implements IAuthRepository {
  AuthRepository(Reader read) : _read = read;

  // ignore: unused_field
  final Reader _read;
  // ignore: unused_field
  final _dio = Dio(); //This is for googlr login

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
      if (user?.uid != null) {
        // if (newSignupRequest.image != null) {
        final fileName = path.basename(newSignupRequest.image?.path ?? '');
        final reference = firebase_storage.FirebaseStorage.instance
            .ref()
            .child('user_profile')
            .child(fileName);

        final uploadTask = reference.putFile(newSignupRequest.image!);
        firebase_storage.TaskSnapshot storageTaskSnapshot;
        await uploadTask.then(
          (value) {
            storageTaskSnapshot = value;
            storageTaskSnapshot.ref.getDownloadURL().then(
              (downloadUrl) async {
                await FirebaseFirestore.instance
                    .collection('users')
                    .doc(user?.uid)
                    .set(
                  {
                    'image': downloadUrl,
                    'fullName': newSignupRequest.fullName,
                    'contact': newSignupRequest.contact,
                    'email': newSignupRequest.email,
                    'address': newSignupRequest.address,
                    'password': newSignupRequest.password,
                    'admin': newSignupRequest.admin,
                    'aboutYou': newSignupRequest.aboutYou,
                  },
                );
                await _auth.signOut();
              },
            );
          },
        );
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

//------user login domain layer------//
  @override
  Future<Either<UserResponse, Failure>> loginUser(
      {required LoginRequest loginRequest}) async {
    try {
      final response = await _auth.signInWithEmailAndPassword(
        email: loginRequest.email,
        password: loginRequest.password,
      );

      final user =
          await _firestore.collection('users').doc(response.user?.uid).get();
      final data = user.data();
      data?.putIfAbsent('userId', () => user.id);

      // ignore: cast_nullable_to_non_nullable
      final result = UserResponse.fromJson(data as Map<String, dynamic>);
      return Left(result);
    } on FirebaseAuthException catch (e) {
      return Right(
        Failure(
          errorMessage:
              e.message ?? 'Something went wrong, try in few moments !',
        ),
      );
    } catch (e) {
      return Right(
        Failure(
          errorMessage: e.toString(),
        ),
      );
    }
  }

  //-------  to get country list------------------
  @override
  Future<Either<CountryListResponse, Failure>> countryNameList() async {
    try {
      final url = Uri.parse(
        //api endpoinds for country list
        'https://countriesnow.space/api/v0.1/countries/flag/unicode',
      );

      final response = await http.get(
        url,
      );
      final parsed = json.decode(response.body);
      final result =
          CountryListResponse.fromJson(parsed as Map<String, dynamic>);
      return Left(result);
    } on DioError catch (e) {
      return Right(
        Failure(
          errorMessage: e.toString(),
        ),
      );
    } catch (e) {
      return Right(
        Failure(
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
