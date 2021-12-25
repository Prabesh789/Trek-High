import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:path/path.dart' as path;
import 'package:trek_high/admin/infrastructure/entities/destination_request.dart';
import 'package:trek_high/admin/infrastructure/entities/destination_response.dart';
import 'package:trek_high/app/entities/failure.dart';

final adminRepository =
    Provider<IAdminRepository>((ref) => AdminRepository(ref.read));

abstract class IAdminRepository {
  Future<Either<DestinationResponse, Failure>> uploadDestination({
    required DestinationRequest destinationRequest,
  });
}

class AdminRepository implements IAdminRepository {
  AdminRepository(Reader read) : _read = read;

  // ignore: unused_field
  final Reader _read;

  @override
  Future<Either<DestinationResponse, Failure>> uploadDestination(
      {required DestinationRequest destinationRequest}) async {
    try {
      // final fileName =
      //     path.basename(destinationRequest.image.map((e) => e.path).toString());
      final fileName = path.basename(destinationRequest.image.path);
      final reference = firebase_storage.FirebaseStorage.instance
          .ref()
          .child('trek_destination_images')
          .child(fileName);
      final uploadImage = reference.putFile(destinationRequest.image);
      firebase_storage.TaskSnapshot storageTaskSnapshot;
      await uploadImage.then(
        (value) {
          storageTaskSnapshot = value;
          storageTaskSnapshot.ref.getDownloadURL().then(
            (downloadUrl) async {
              await FirebaseFirestore.instance
                  .collection('trek_destination')
                  .doc()
                  .set(
                {
                  'title': destinationRequest.title,
                  'aboutInfo': destinationRequest.aboutInfo,
                  'features': destinationRequest.features,
                  'rules': destinationRequest.rules,
                  'bagPacking': destinationRequest.bagPacking,
                  'helpingLines': destinationRequest.helpingLines,
                  'image': downloadUrl,
                  'startedPoints': destinationRequest.startedPoints,
                  'endingPoints': destinationRequest.endingPoints,
                },
              );
            },
          );
        },
      );
      return Left(
        DestinationResponse(
          data: null,
          isSuccess: true,
          message: '',
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
