import 'dart:io';
import 'package:path_provider/path_provider.dart';

class DataCaptureService {
  static Future<void> saveDataToFile(String data) async {
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/captured_data.txt');

    // If the file doesn't exist, create it
    if (!await file.exists()) {
      await file.create();
    }

    // Append the data to the file
    await file.writeAsString(data, mode: FileMode.append);
  }
}
