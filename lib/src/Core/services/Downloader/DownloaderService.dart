import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:jumper/src/Core/utils/utils.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class DownloaderService {
  DownloaderService._();

  /// Plugin must be initialized before using it.
  static Future<void> init() async {
    await FlutterDownloader.initialize(
      debug: true,
      // optional: set to false to disable printing logs to console (default: true)
      ignoreSsl:
          true, // option: set to false to disable working with http links (default: false)
    );
  }

  /// [url] : url of the file to download , [path] : path to save the downloaded file
  static void downloadAndLoad({required String url}) async {
    final status = await Permission.storage.request();
    final externalDir = await getApplicationSupportDirectory();
    if (status.isGranted) {
      try {
        final taskId = await FlutterDownloader.enqueue(
          url: url,
          savedDir: externalDir.path,
          showNotification: true,
          fileName: 'file_name${DateTime.now()}',
          openFileFromNotification: true,
        );
        await FlutterDownloader.open(taskId: taskId!);
        await FlutterDownloader.loadTasks().then((value) => printDM("$value"));
      } catch (e) {
        printDM("Error is =>$e");
      }
    }
  }
}
