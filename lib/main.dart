import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:io';

import 'package:abolfazl_flutter_testtask/constants/route_name/route_name.dart';
import 'package:abolfazl_flutter_testtask/data/api_calls/image_api_call.dart';
import 'package:abolfazl_flutter_testtask/ui/routes/app_routes.dart';

void main() {
  HttpOverrides.global = MyHttpOverrides();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: RoutePath.home,
      getPages: AppRoute.routes,
      smartManagement: SmartManagement.full,
    );
  }
}
