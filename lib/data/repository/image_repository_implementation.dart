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
}