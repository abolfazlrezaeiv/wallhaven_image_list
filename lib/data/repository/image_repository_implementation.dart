import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:dio/dio.dart';
import 'package:flutter_cache_manager/file.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:abolfazl_flutter_testtask/domain/interfaces/api_calls/image_api_calls_interface.dart';
import 'package:abolfazl_flutter_testtask/domain/interfaces/base_repositories/image_repository_interface.dart';
import 'package:abolfazl_flutter_testtask/domain/models/api_requests/image_request_model.dart';
import 'package:abolfazl_flutter_testtask/domain/models/api_responses/image_response_model.dart';

class ImageRepository implements ImageRepositoryInterface {
  final ImageApiCallInteface imageApiCall;

  ImageRepository(this.imageApiCall);

  @override
  Future<ImageListPage<ImageResponseModel>> getImageList(
      ImageRequestModel imageRequestModel) async {
    return await imageApiCall.getImageList(imageRequestModel);
  }

  @override
  Future<File> cacheImage(String imageUrl) async {
    return await DefaultCacheManager().getSingleFile(imageUrl);
  }

  @override
  Future<String> getFilePath(uniqueFileName) async {
    String path = '';
    Directory dir = await getApplicationDocumentsDirectory();
    path = '${dir.path}/$uniqueFileName';
    return path;
  }

  @override
  Future downloadFile(
    String imageUrl,
    void Function(int, int)? onReciveFunc,
  ) async {
    Dio dio = Dio();
    String fileName = imageUrl.substring(imageUrl.lastIndexOf("/") + 1);
    var savePath = await getFilePath(fileName);
    await dio.download(imageUrl, savePath, onReceiveProgress: onReciveFunc);
  }
}
