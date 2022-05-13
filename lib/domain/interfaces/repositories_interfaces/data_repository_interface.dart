import 'package:abolfazl_flutter_testtask/domain/models/pagination/pagination.dart';
import 'package:flutter_cache_manager/file.dart';

abstract class DataRepository<ApiResponse, ApiRequest> {
  Future<ListPage<ApiResponse>> getPaginatedDataList(
      ApiRequest apiRequestModel);

  Future<File> cacheFile(String fileUrl);

  Future<String> getFilePath(uniqueFileName);

  Future downloadFile(String fileUrl, Function(int, int)? onReciveFunc);
}
