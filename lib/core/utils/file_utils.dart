import 'package:file_picker/file_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class FileUtils {
  /// 🟢 Common Permission Handler
  static Future<bool> _requestMediaPermissions() async {
    // Camera permission (optional)
    var cameraStatus = await Permission.camera.request();

    // Storage / Media (Android 11+ support bhi)
    var photosStatus = await Permission.photos.request();
    var storageStatus = await Permission.storage.request();

    if (cameraStatus.isGranted &&
        (photosStatus.isGranted || storageStatus.isGranted)) {
      return true;
    } else {
      return false;
    }
  }

  static Future<List<String>?> pickMultipleImages() async {
    bool granted = await _requestMediaPermissions();
    if (!granted) return null;

    final result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: true,
    );
    return result?.paths.whereType<String>().toList();
  }

  /// 📄 Multiple Files (PDF, Docs, etc.)
  static Future<List<String>?> pickMultipleDocuments() async {
    bool granted = await _requestMediaPermissions();
    if (!granted) return null;

    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowMultiple: true,
      allowedExtensions: ['pdf', 'doc', 'docx', 'xlsx', 'pptx'],
    );
    return result?.paths.whereType<String>().toList();
  }
}
