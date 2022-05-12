import 'package:abolfazl_flutter_testtask/constants/message/app_messages.dart';
import 'package:abolfazl_flutter_testtask/constants/padding/app_paddings.dart';
import 'package:abolfazl_flutter_testtask/constants/size/app_size.dart';
import 'package:abolfazl_flutter_testtask/domain/models/api_responses/image_response_model.dart';
import 'package:abolfazl_flutter_testtask/ui/features/home_page/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PagedListView.separated(
        pagingController: controller.pagingController,
        builderDelegate: PagedChildBuilderDelegate<ImageResponseModel>(
          itemBuilder: (context, ads, index) => Padding(
            padding: AppPadding.a20,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Image.network(
                  ads.url!,
                  fit: BoxFit.cover,
                  height: AppSize.s150,
                  width: AppSize.s200,
                ),
                MaterialButton(
                  color: Colors.amber,
                  onPressed: () => controller.goToWallpaperDetail(ads.url!),
                  child: const Text(AppMessage.homePageDetailButtonTitle),
                )
              ],
            ),
          ),
        ),
        separatorBuilder: (context, index) => const SizedBox(),
      ),
    );
  }
}
