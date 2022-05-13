import 'package:flutter_cache_manager/file.dart';
import 'package:abolfazl_flutter_testtask/domain/models/api_responses/image_response_model.dart';

abstract class DataRepository<ApiResponse, ApiRequest> {
  Future<ListPage<ApiResponse>> getPaginatedDataList(
      ApiRequest imageRequestModel);

  Future<File> cacheFile(String imageUrl);

  Future<String> getFilePath(uniqueFileName);

  Future downloadFile(String imageUrl, void Function(int, int)? onReciveFunc);
}
