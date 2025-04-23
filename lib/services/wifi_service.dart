import 'package:network_info_plus/network_info_plus.dart';

class WifiService {
  static Future<int> getSignalStrength() async {
    final info = NetworkInfo();
    // Signal strength isn't supported directly; placeholder:
    final wifiName = await info.getWifiName();
    return wifiName != null ? 100 : -999;
  }
}
