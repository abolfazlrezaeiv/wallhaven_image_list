import 'package:abolfazl_flutter_testtask/constants/url/api_endpoint_urls.dart';
import 'package:abolfazl_flutter_testtask/domain/interfaces/api_calls/image_api_calls_interface.dart';
import 'package:abolfazl_flutter_testtask/domain/models/api_requests/image_request_model.dart';
import 'package:abolfazl_flutter_testtask/domain/models/api_responses/image_response_model.dart';
import 'package:get/get_connect/connect.dart';

class ImageApiCall extends GetConnect implements ImageApiCallInteface {
  @override
  List<ImageResponseModel> imageList = [];
  @override
  Future<ImageListPage<ImageResponseModel>> getImageList(
      ImageRequestModel imageRequestModel) async {
    final response = await get(
        AppUrls.wallhavenApiUrl + imageRequestModel.pageNumber.toString());
    var total = response.body['meta']['total'];
    var data = response.body['data'];

    if (response.statusCode == 200) {
      data.forEach(
        (element) => imageList.add(
          ImageResponseModel.fromJson(element),
        ),
      );

      return ImageListPage(itemList: imageList, grandTotalCount: total);
    } else {
      return ImageListPage(itemList: imageList, grandTotalCount: total);
    }
  }
}
