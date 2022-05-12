import 'package:get/get.dart';
import 'package:abolfazl_flutter_testtask/domain/interfaces/base_repositories/image_repository_interface.dart';
import 'package:abolfazl_flutter_testtask/ui/features/wallpaper_detail_page/controller/wallpaper_detail_controller.dart';

class WallpaperDetailBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<WalpaperDetailController>(
      WalpaperDetailController(
        repository: ImageRepositoryInterface(),
      ),
    );
  }
}
