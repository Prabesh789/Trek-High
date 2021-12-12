import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:path/path.dart' as path;
import 'package:trek_high/app/entities/failure.dart';
import 'package:trek_high/features/find_friends/infrastructure/entities/post_travel_request/post_travel_request.dart';
import 'package:trek_high/features/find_friends/infrastructure/entities/post_travel_response/post_travel_model.dart';
import 'package:trek_high/features/share_story/infrastructure/entities/post_stories_request.dart';
import 'package:trek_high/features/share_story/infrastructure/entities/post_stories_response.dart';

final postTravelRepository =
    Provider<IPostTravelRepository>((ref) => PostTravelRepository(ref.read));

abstract class IPostTravelRepository {
  Future<Either<PostTravelResponse, Failure>> postTrek({
    required PostTravelRequest postTravelRequest,
  });
}

class PostTravelRepository implements IPostTravelRepository {
  PostTravelRepository(Reader read) : _read = read;

  // ignore: unused_field
  final Reader _read;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<Either<PostTravelResponse, Failure>> postTrek(
      {required PostTravelRequest postTravelRequest}) async {
    try {
      await _firestore.collection('travellers').doc().set({
        'trek': postTravelRequest.trek,
        'date': postTravelRequest.date,
        'isEmail': postTravelRequest.myEmail,
        'isContact': postTravelRequest.myContact,
        'userId': postTravelRequest.userId,
      });
      return Left(
        PostTravelResponse(
          code: 200,
          message: 'Success',
        ),
      );
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
}
