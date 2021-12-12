import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trek_high/app/entities/failure.dart';
import 'package:trek_high/core/entities/base_state.dart';
import 'package:trek_high/features/find_friends/infrastructure/entities/post_travel_request/post_travel_request.dart';
import 'package:trek_high/features/find_friends/infrastructure/entities/post_travel_response/post_travel_model.dart';
import 'package:trek_high/features/find_friends/infrastructure/repository/find_friends_repository.dart';
import 'package:uuid/uuid.dart';

PostTrekController<T> postTrekController<T>(ProviderReference ref) {
  return PostTrekController<T>(
    ref.read,
  );
}

class PostTrekController<T> extends StateNotifier<BaseState> {
  PostTrekController(
    this._read,
  ) : super(const BaseState<void>.initial());

  final Reader _read;
  Uuid uuid = const Uuid();
  IPostTravelRepository get _repo => _read(postTravelRepository);

  Future<void> postTrek({
    required String trek,
    required String date,
    required String userId,
    required String? myEmail,
    required String? myContact,
  }) async {
    state = const BaseState<void>.loading();

    final postTrek = PostTravelRequest(
      trek: trek,
      date: date,
      myContact: myContact,
      userId: userId,
      myEmail: myEmail,
    );
    final response = await _repo.postTrek(postTravelRequest: postTrek);

    state = response.fold(
      (success) => BaseState<PostTravelResponse>.success(data: success),
      (error) => BaseState<Failure>.error(error),
    );
  }
}
