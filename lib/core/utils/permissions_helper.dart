import 'package:permission_handler/permission_handler.dart';

class PermissionsHelper {
  static Future<bool> requestMediaPermissions() async {
    var cameraStatus = await Permission.camera.request();

    // Storage / Media (Android 11+ ka support bhi hai)
    var photosStatus = await Permission.photos.request();
    var storageStatus = await Permission.storage.request();

    if (cameraStatus.isGranted &&
        (photosStatus.isGranted || storageStatus.isGranted)) {
      return true; // ✅ Permission granted
    } else {
      return false; // ❌ Permission denied
    }
  }
}
