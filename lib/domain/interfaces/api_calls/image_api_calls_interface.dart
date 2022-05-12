import 'package:abolfazl_flutter_testtask/data/api_calls/image_api_calls_implementation.dart';
import 'package:abolfazl_flutter_testtask/domain/models/api_requests/image_request_model.dart';
import 'package:abolfazl_flutter_testtask/domain/models/api_responses/image_response_model.dart';

abstract class ImageApiCallInteface {
  List<ImageResponseModel> imageList = [];

  Future<ImageListPage<ImageResponseModel>> getImageList(
      ImageRequestModel imageRequestModel);

  factory ImageApiCallInteface() => ImageApiCall();
}
