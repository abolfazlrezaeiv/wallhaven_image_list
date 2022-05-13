import 'package:abolfazl_flutter_testtask/domain/models/pagination/pagination.dart';

abstract class ApiCall<ApiResponse, ApiRequest> {
  List<ApiResponse> dataList = [];

  Future<ListPage<ApiResponse>> getPginatedDataList(ApiRequest apiRequestModel);
}
