import 'package:flutter/material.dart';
import 'services/camera_service.dart';
import 'services/location_service.dart';
import 'services/sensor_service.dart';
import 'services/wifi_service.dart';
import 'services/data_capture_service.dart';

void main() {
  runApp(const DataCaptureApp());
}

class DataCaptureApp extends StatelessWidget {
  const DataCaptureApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Data Capture',
      home: const CaptureScreen(),
    );
  }
}

class CaptureScreen extends StatefulWidget {
  const CaptureScreen({super.key});

  @override
  State<CaptureScreen> createState() => _CaptureScreenState();
}

class _CaptureScreenState extends State<CaptureScreen> {
  String result = "";

  Future<void> captureAllData() async {
    final imagePath = await CameraService.captureImage();
    final location = await LocationService.getLocation();
    final wifiStrength = await WifiService.getSignalStrength();
    final sensorData = await SensorService.getSensorData();

    final dataToSave = '''Image Path: $imagePath
Location: $location
WiFi: $wifiStrength dBm
Sensor: $sensorData
-----------------------------
''';

    // Save data to a file
    await DataCaptureService.saveDataToFile(dataToSave);

    setState(() {
      result = '''Image Path: $imagePath
Location: $location
WiFi: $wifiStrength dBm
Sensor: $sensorData''';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Capture Data')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: captureAllData,
              child: const Text('Capture Now'),
            ),
            const SizedBox(height: 20),
            Expanded(child: SingleChildScrollView(child: Text(result))),
          ],
        ),
      ),
    );
  }
}
