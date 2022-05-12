import 'package:get/get.dart';
import 'package:abolfazl_flutter_testtask/domain/interfaces/base_repositories/image_repository_interface.dart';
import 'package:abolfazl_flutter_testtask/ui/features/home_page/controller/home_controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<HomeController>(
      HomeController(
        repository: ImageRepositoryInterface(),
      ),
    );
  }
}
