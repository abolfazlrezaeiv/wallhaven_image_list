import 'package:abolfazl_flutter_testtask/constants/message/app_messages.dart';
import 'package:abolfazl_flutter_testtask/constants/size/app_size.dart';
import 'package:abolfazl_flutter_testtask/ui/features/wallpaper_detail_page/controller/wallpaper_detail_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WallpaperDetailPage extends GetView<WalpaperDetailController> {
  const WallpaperDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Image.network(controller.url.value),
          const SizedBox(height: AppSize.s20),
          MaterialButton(
            onPressed: () => controller.setWallpaperFromFile(),
            color: Colors.amberAccent,
            child: const Text(AppMessage.wallpaperPageSetWallpaperButtonTitle),
          ),
          const SizedBox(height: AppSize.s20),
          MaterialButton(
            onPressed: () => controller.setWallpaperFromFile(),
            color: Colors.amberAccent,
            child: const Text(
              AppMessage.wallpaperPageDownloadWallpaperButtonTitle,
            ),
          )
        ],
      ),
    );
  }
}
