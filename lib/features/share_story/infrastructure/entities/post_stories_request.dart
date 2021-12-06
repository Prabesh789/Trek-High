import 'dart:io';

class PostStoryRequest {
  PostStoryRequest({
    required this.title,
    required this.image,
  });
  final String title;
  final File image;
}
