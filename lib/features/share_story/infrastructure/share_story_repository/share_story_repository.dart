import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:path/path.dart' as path;
import 'package:trek_high/app/entities/failure.dart';
import 'package:trek_high/features/share_story/infrastructure/entities/post_stories_request.dart';
import 'package:trek_high/features/share_story/infrastructure/entities/post_stories_response.dart';

final shareStoryRepository =
    Provider<IShareStoryRepository>((ref) => ShareStoryRepository(ref.read));

abstract class IShareStoryRepository {
  Future<Either<PostStoryResponse, Failure>> shareStory({
    required PostStoryRequest postStoryRequest,
  });
}

class ShareStoryRepository implements IShareStoryRepository {
  ShareStoryRepository(Reader read) : _read = read;

  // ignore: unused_field
  final Reader _read;

  @override
  Future<Either<PostStoryResponse, Failure>> shareStory(
      {required PostStoryRequest postStoryRequest}) async {
    try {
      final fileName = path.basename(postStoryRequest.image.path);
      final reference = firebase_storage.FirebaseStorage.instance
          .ref()
          .child('travelers_stories_images')
          .child(fileName);
      final uploadImage = reference.putFile(postStoryRequest.image);
      firebase_storage.TaskSnapshot storageTaskSnapshot;
      await uploadImage.then(
        (value) {
          storageTaskSnapshot = value;
          storageTaskSnapshot.ref.getDownloadURL().then(
            (downloadUrl) async {
              await FirebaseFirestore.instance
                  .collection('travelers_stories')
                  .doc()
                  .set(
                {
                  'title': postStoryRequest.title,
                  'image': downloadUrl,
                  'userId': postStoryRequest.userId,
                  'isFavorite': postStoryRequest.isFavorite,
                },
              );
            },
          );
        },
      );
      return Left(
        PostStoryResponse(
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
