import 'dart:async';
import 'package:sensors_plus/sensors_plus.dart';

class SensorService {
  static Future<String> getSensorData() async {
    final c = Completer<String>();

    final sub = accelerometerEvents.listen((event) {
      c.complete('X: ${event.x}, Y: ${event.y}, Z: ${event.z}');
      sub.cancel();
    });

    return c.future;
  }
}
