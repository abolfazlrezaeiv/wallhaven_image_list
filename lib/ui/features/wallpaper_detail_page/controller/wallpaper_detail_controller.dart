import 'package:abolfazl_flutter_testtask/domain/interfaces/base_repositories/image_repository_interface.dart';
import 'package:get/get.dart';

class WalpaperDetailController extends GetxController {
  WalpaperDetailController({required this.repository});

  final ImageRepositoryInterface repository;

  RxString url = ''.obs;

  @override
  void onInit() {
    url.value = Get.arguments;
    super.onInit();
  }
}
