import 'package:abolfazl_flutter_testtask/constants/route_name/route_name.dart';
import 'package:abolfazl_flutter_testtask/ui/features/home_page/binding/home_binding.dart';
import 'package:abolfazl_flutter_testtask/ui/features/home_page/view/page/home_page.dart';
import 'package:abolfazl_flutter_testtask/ui/features/wallpaper_detail_page/binding/wallpaper_detail_binding.dart';
import 'package:abolfazl_flutter_testtask/ui/features/wallpaper_detail_page/view/page/wallpaper_detail_page.dart';
import 'package:get/get.dart';

class AppRoute {
  static final routes = [
    GetPage(
      name: RoutePath.home,
      page: () => const HomePage(),
      transition: Transition.noTransition,
      binding: HomeBinding(),
    ),
    GetPage(
      name: RoutePath.detail,
      page: () => const WallpaperDetailPage(),
      transition: Transition.noTransition,
      binding: WallpaperDetailBinding(),
    ),
  ];
}
