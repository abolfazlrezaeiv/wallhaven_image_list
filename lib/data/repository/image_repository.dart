import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:dio/dio.dart';
import 'package:flutter_cache_manager/file.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:abolfazl_flutter_testtask/domain/interfaces/api_call_interfaces/api_call_interface.dart';
import 'package:abolfazl_flutter_testtask/domain/interfaces/repositories_interfaces/data_repository_interface.dart';
import 'package:abolfazl_flutter_testtask/domain/models/api_requests/image_request_model.dart';
import 'package:abolfazl_flutter_testtask/domain/models/pagination/pagination.dart';
import 'package:abolfazl_flutter_testtask/domain/models/api_responses/image_response_model.dart';

class ImageRepository
    implements DataRepository<ImageResponseModel, ImageRequestModel> {
  final ApiCall<ImageResponseModel, ImageRequestModel> imageApiCall;

  ImageRepository(this.imageApiCall);

  @override
  Future<ListPage<ImageResponseModel>> getPaginatedDataList(
      ImageRequestModel imageRequestModel) async {
    return await imageApiCall.getPginatedDataList(imageRequestModel);
  }

  @override
  Future<File> cacheFile(String fileUrl) async {
    return await DefaultCacheManager().getSingleFile(fileUrl);
  }

  @override
  Future<String> getFilePath(uniqueFileName) async {
    Directory dir = await getApplicationDocumentsDirectory();
    return '${dir.path}/$uniqueFileName';
  }

  @override
  Future downloadFile(String fileUrl, Function(int, int)? onReciveFunc) async {
    String fileName = fileUrl.substring(fileUrl.lastIndexOf("/") + 1);
    var savePath = await getFilePath(fileName);
    await Dio().download(fileUrl, savePath, onReceiveProgress: onReciveFunc);
  }
}
