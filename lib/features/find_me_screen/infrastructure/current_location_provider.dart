import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:location/location.dart';
import 'package:trek_high/core/utils/permission_handler/permission_checker.dart';
import 'package:trek_high/features/find_me_screen/infrastructure/entities/current_location_model.dart';

/* controller for checking location permission and service status */
final locationController =
    StateNotifierProvider.autoDispose<LocationController, CurrentLocationData>(
        (ref) => LocationController(ref.read));

/* provider for current lat & long */
final currentLocationProvider =
    ChangeNotifierProvider<CurrentLocationProvider>((ref) {
  return CurrentLocationProvider();
});

class CurrentLocationProvider extends ChangeNotifier {
  CurrentLocationData? currentLocationData;

  void updateValue(CurrentLocationData? value) {
    currentLocationData = value;
    notifyListeners();
  }
}

class LocationController extends StateNotifier<CurrentLocationData> {
  LocationController(this._reader) : super(const CurrentLocationData());
  final Reader _reader;
  final Location location = Location();
  bool serviceEnabledResult = false;

  CurrentLocationProvider get _currentLocationProvider =>
      _reader(currentLocationProvider);

  Future<CurrentLocationData?> determinePosition(BuildContext context) async {
    await PermissionChecker.hasLocationPermission(context).then(
      (status) async {
        if (status) {
          serviceEnabledResult = await location.serviceEnabled();
          if (serviceEnabledResult) {
            final response = await Geolocator.getCurrentPosition();
            final currentLocation = CurrentLocationData(
              latitude: response.latitude,
              longitude: response.longitude,
            );
            _currentLocationProvider.updateValue(currentLocation);
            // await _reader(postUserLastActiveController.notifier).postLastActive(
            //   userLogActiveRequest: UserLogActiveRequest(
            //     latitude: response.latitude,
            //     longitude: response.longitude,
            //   ),
            // );
            return currentLocation;
          } else {
            serviceEnabledResult = await location.requestService();
          }
        } else {
          _currentLocationProvider.updateValue(null);
        }
      },
    );
  }
}
