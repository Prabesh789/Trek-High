import 'dart:io';

class PostStoryRequest {
  PostStoryRequest({
    required this.title,
    required this.image,
    required this.userId,
    required this.isFavorite,
  });
  final String title;
  final File image;
  final String userId;
  final bool isFavorite;
}
