import 'package:abolfazl_flutter_testtask/domain/models/api_responses/image_response_model.dart';

abstract class ApiCall<ApiResponse, ApiRequest> {
  List<ApiResponse> imageList = [];

  Future<ListPage<ApiResponse>> getImageList(ApiRequest imageRequestModel);
}
