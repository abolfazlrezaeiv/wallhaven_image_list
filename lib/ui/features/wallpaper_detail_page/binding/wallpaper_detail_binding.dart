import 'package:abolfazl_flutter_testtask/data/api_calls/image_api_call.dart';
import 'package:abolfazl_flutter_testtask/data/repository/image_repository.dart';
import 'package:get/get.dart';
import 'package:abolfazl_flutter_testtask/ui/features/wallpaper_detail_page/controller/wallpaper_detail_controller.dart';

class WallpaperDetailBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<WalpaperDetailController>(
      WalpaperDetailController(
        repository: ImageRepository(ImageApiCall()),
      ),
    );
  }
}
