import 'dart:io';
import 'package:image_picker/image_picker.dart';

class CameraService {
  static Future<String?> captureImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    return pickedFile?.path;
  }
}
