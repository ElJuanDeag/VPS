import 'package:geolocator/geolocator.dart';

class LocationService {
  static Future<String> getLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) return 'Location not enabled';

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) return 'Location denied';
    }

    Position position = await Geolocator.getCurrentPosition();
    return '${position.latitude}, ${position.longitude}';
  }
}
