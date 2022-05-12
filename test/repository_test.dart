import 'package:abolfazl_flutter_testtask/data/api_calls/image_api_calls_implementation.dart';
import 'package:abolfazl_flutter_testtask/data/repository/image_repository_implementation.dart';
import 'package:abolfazl_flutter_testtask/domain/models/api_requests/image_request_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  test(
    'List shoudnt be empty',
    () async {
      var userRepository = ImageRepository(ImageApiCall());
      var result = await userRepository.getImageList(ImageRequestModel(1));
      expect(result.itemList, isNotEmpty);
    },
  );

  test(
    'Confirms that this file is cached from the network',
    () async {
      var userRepository = ImageRepository(ImageApiCall());
      var result = await userRepository
          .cacheImage('https://w.wallhaven.cc/full/qd/wallhaven-qd88qd.jpg');
      expect(result.exists(), isTrue);
    },
  );
}
