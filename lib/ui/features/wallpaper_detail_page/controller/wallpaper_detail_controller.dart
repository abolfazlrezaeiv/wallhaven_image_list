import 'package:abolfazl_flutter_testtask/domain/interfaces/repositories_interfaces/data_repository_interface.dart';
import 'package:get/get.dart';
import 'package:wallpaper_manager_flutter/wallpaper_manager_flutter.dart';
import 'package:abolfazl_flutter_testtask/constants/message/app_messages.dart';

class WalpaperDetailController extends GetxController {
  WalpaperDetailController({required this.repository});

  final DataRepository repository;

  RxString url = ''.obs;
  RxBool isDownloading = false.obs;
  RxString downloadingStr = ''.obs;

  @override
  void onInit() {
    url.value = Get.arguments;
    super.onInit();
  }

  Future<void> setWallpaperFromFile() async {
    var file = await repository.cacheFile(url.value);
    try {
      await WallpaperManagerFlutter().setwallpaperfromFile(
        file,
        WallpaperManagerFlutter.HOME_SCREEN,
      );
    } catch (_) {
      Get.snackbar(
        AppMessage.emptyMessage,
        AppMessage.setWallpaperFailedSnackbarMessage,
      );
    }
  }

  Future downloadFile() async {
    try {
      await repository.downloadFile(url.value, (rec, total) {
        isDownloading.value = true;
        var percentage = '${(rec ~/ 10000)}%';
        downloadingStr.value = percentage;
      });
      isDownloading.value = false;
      downloadingStr.value = AppMessage.downloadWallpaperCompletedMessage;
    } catch (_) {
      Get.snackbar(
        AppMessage.emptyMessage,
        AppMessage.downloadWallpaperFailedSnackbarMessage,
      );
    }
  }
}
