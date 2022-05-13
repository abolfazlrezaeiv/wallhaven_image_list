import 'dart:io';
import 'package:get/get_connect/connect.dart';
import 'package:abolfazl_flutter_testtask/constants/url/api_endpoint_urls.dart';
import 'package:abolfazl_flutter_testtask/domain/interfaces/api_calls/api_call.dart';
import 'package:abolfazl_flutter_testtask/domain/models/api_requests/image_request_model.dart';
import 'package:abolfazl_flutter_testtask/domain/models/api_responses/image_response_model.dart';

class ImageApiCall extends GetConnect
    implements ApiCall<ImageResponseModel, ImageRequestModel> {
  @override
  List<ImageResponseModel> imageList = [];
  @override
  Future<ListPage<ImageResponseModel>> getImageList(
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
      return ListPage(itemList: imageList, grandTotalCount: total);
    } else {
      return ListPage(itemList: imageList, grandTotalCount: total);
    }
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
