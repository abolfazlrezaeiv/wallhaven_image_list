import 'package:abolfazl_flutter_testtask/ui/features/wallpaper_detail_page/controller/wallpaper_detail_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WallpaperDetailPage extends GetView<WalpaperDetailController> {
  const WallpaperDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [Image.network(controller.url.value)],
      ),
    );
  }
}
