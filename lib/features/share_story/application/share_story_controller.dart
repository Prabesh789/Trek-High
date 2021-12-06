import 'dart:io';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trek_high/app/entities/failure.dart';
import 'package:trek_high/core/entities/base_state.dart';
import 'package:trek_high/features/share_story/infrastructure/entities/post_stories_request.dart';
import 'package:trek_high/features/share_story/infrastructure/entities/post_stories_response.dart';
import 'package:trek_high/features/share_story/infrastructure/share_story_repository/share_story_repository.dart';
import 'package:uuid/uuid.dart';

ShareStoryController<T> shareStoryController<T>(ProviderReference ref) {
  return ShareStoryController<T>(
    ref.read,
  );
}

class ShareStoryController<T> extends StateNotifier<BaseState> {
  ShareStoryController(
    this._read,
  ) : super(const BaseState<void>.initial());

  final Reader _read;
  Uuid uuid = const Uuid();
  IShareStoryRepository get _repo => _read(shareStoryRepository);

  Future<void> shareStory({
    required String title,
    required File image,
  }) async {
    state = const BaseState<void>.loading();

    final shareStory = PostStoryRequest(
      title: title,
      image: image,
    );
    final response = await _repo.shareStory(postStoryRequest: shareStory);

    state = response.fold(
      (success) => BaseState<PostStoryResponse>.success(data: success),
      (error) => BaseState<Failure>.error(error),
    );
  }
}
