import 'package:abolfazl_flutter_testtask/ui/features/home_page/view/components/home_image_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:abolfazl_flutter_testtask/domain/models/api_responses/image_response_model.dart';
import 'package:abolfazl_flutter_testtask/ui/features/home_page/controller/home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: PagedListView.separated(
        pagingController: controller.pagingController,
        builderDelegate: PagedChildBuilderDelegate<ImageResponseModel>(
          itemBuilder: (context, image, index) => HomeImageItem(
            url: image.url!,
            onNavigateButtonTapped: () =>
                controller.goToWallpaperDetail(image.url!),
          ),
        ),
        separatorBuilder: (context, index) => const SizedBox(),
      ),
    );
  }
}
