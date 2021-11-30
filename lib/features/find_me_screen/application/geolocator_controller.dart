import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trek_high/core/entities/base_state.dart';
import 'package:trek_high/features/find_me_screen/infrastructure/geolocator_service.dart';

GeolocatorController<T> geolocatorController<T>(ProviderReference ref) {
  return GeolocatorController<T>(
    ref.read,
  );
}

class GeolocatorController<T> extends StateNotifier<BaseState> {
  GeolocatorController(
    this._read,
  ) : super(const BaseState<void>.initial());

  final Reader _read;

  IGeolocatorService get _repo => _read(geolocatorService);

  Future<LatLng> getCurrentLocation() async {
    final currentLocation = _repo.getCurrentLocation() as Position;
    return LatLng(
      currentLocation.latitude,
      currentLocation.longitude,
    );
  }
}
