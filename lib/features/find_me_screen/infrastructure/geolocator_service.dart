import 'package:geolocator/geolocator.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final geolocatorService =
    Provider<IGeolocatorService>((ref) => GeolocatorService(ref.read));

abstract class IGeolocatorService {
  Future<Position> getCurrentLocation();
}

class GeolocatorService implements IGeolocatorService {
  GeolocatorService(Reader read) : _read = read;

  // ignore: unused_field
  final Reader _read;
  @override
  Future<Position> getCurrentLocation() async {
    return Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
  }
}
