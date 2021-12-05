import 'dart:io';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trek_high/admin/infrastructure/entities/destination_request.dart';
import 'package:trek_high/admin/infrastructure/entities/destination_response.dart';
import 'package:trek_high/admin/infrastructure/repository/admin_repository.dart';
import 'package:trek_high/app/entities/failure.dart';
import 'package:trek_high/core/entities/base_state.dart';
import 'package:uuid/uuid.dart';

AdminController<T> adminController<T>(ProviderReference ref) {
  return AdminController<T>(
    ref.read,
  );
}

class AdminController<T> extends StateNotifier<BaseState> {
  AdminController(
    this._read,
  ) : super(const BaseState<void>.initial());

  final Reader _read;
  Uuid uuid = const Uuid();
  IAdminRepository get _repo => _read(adminRepository);

  Future<void> uploadTrekDestination({
    required String title,
    required String aboutInfo,
    required String features,
    required String rules,
    required String bagPacking,
    required String helpingLines,
    required File image,
    required String startedPoints,
    required String endingPoints,
  }) async {
    state = const BaseState<void>.loading();

    final destinationRequest = DestinationRequest(
      title: title,
      aboutInfo: aboutInfo,
      features: features,
      rules: rules,
      bagPacking: bagPacking,
      helpingLines: helpingLines,
      image: image,
      startedPoints: startedPoints,
      endingPoints: endingPoints,
    );
    final response =
        await _repo.uploadDestination(destinationRequest: destinationRequest);

    state = response.fold(
      (success) => BaseState<DestinationResponse>.success(data: success),
      (error) => BaseState<Failure>.error(error),
    );
  }
}
