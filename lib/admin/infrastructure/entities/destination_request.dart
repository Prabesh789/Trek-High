import 'dart:io';

class DestinationRequest {
  DestinationRequest({
    required this.title,
    required this.aboutInfo,
    required this.features,
    required this.rules,
    required this.bagPacking,
    required this.helpingLines,
    required this.image,
    required this.startedPoints,
    required this.endingPoints,
  });
  final String title;
  final String aboutInfo;
  final String features;
  final String rules;
  final String bagPacking;
  final String helpingLines;
  final File image;
  final String startedPoints;
  final String endingPoints;
}
