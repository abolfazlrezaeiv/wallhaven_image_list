import 'package:abolfazl_flutter_testtask/constants/message/app_messages.dart';
import 'package:abolfazl_flutter_testtask/domain/interfaces/base_repositories/image_repository_interface.dart';
import 'package:get/get.dart';
import 'package:wallpaper_manager_flutter/wallpaper_manager_flutter.dart';

class WalpaperDetailController extends GetxController {
  WalpaperDetailController({required this.repository});

  final ImageRepositoryInterface repository;

  RxString url = ''.obs;

  @override
  void onInit() {
    url.value = Get.arguments;
    super.onInit();
  }

  Future<void> setWallpaperFromFile() async {
    var file = await repository.cacheImage(url.value);
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
}
