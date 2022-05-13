import 'package:abolfazl_flutter_testtask/data/api_calls/image_api_call.dart';
import 'package:abolfazl_flutter_testtask/data/repository/image_repository.dart';
import 'package:get/get.dart';
import 'package:abolfazl_flutter_testtask/ui/features/home_page/controller/home_controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<HomeController>(
      HomeController(
        repository: ImageRepository(ImageApiCall()),
      ),
    );
  }
}
