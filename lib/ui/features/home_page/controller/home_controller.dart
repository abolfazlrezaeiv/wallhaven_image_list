import 'package:abolfazl_flutter_testtask/constants/route_name/route_name.dart';
import 'package:abolfazl_flutter_testtask/domain/interfaces/base_repositories/image_repository_interface.dart';
import 'package:abolfazl_flutter_testtask/domain/models/api_requests/image_request_model.dart';
import 'package:abolfazl_flutter_testtask/domain/models/api_responses/image_response_model.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class HomeController extends GetxController {
  HomeController({required this.repository});

  final pagingController =
      PagingController<int, ImageResponseModel>(firstPageKey: 1);

  final ImageRepositoryInterface repository;

  @override
  void onInit() {
    pagingController.addPageRequestListener((pageKey) async {
      await fetchImage(pageKey);
    });
    super.onInit();
  }

  Future<void> fetchImage(int pageKey) async {
    try {
      var request = ImageRequestModel(pageKey);
      var newPage = await repository.getImageList(request);

      final previouslyFetchedItemsCount =
          pagingController.itemList?.length ?? 0;

      final isLastPage = newPage.isLastPage(previouslyFetchedItemsCount);
      final newItems = newPage.itemList;

      if (isLastPage) {
        pagingController.appendLastPage(newItems);
      } else {
        final nextPageKey = pageKey + 1;
        pagingController.appendPage(newItems, nextPageKey);
      }
    } catch (error) {
      pagingController.error = error;
    }
  }

  void goToWallpaperDetail(String imageUrl) {
    Get.toNamed(RoutePath.detail, arguments: imageUrl);
  }
}
