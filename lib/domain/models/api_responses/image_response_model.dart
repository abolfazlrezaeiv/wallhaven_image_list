class ImageResponseModel {
  final String? url;

  ImageResponseModel({required this.url});

  factory ImageResponseModel.fromJson(Map<String, dynamic> json) {
    return ImageResponseModel(url: json["path"]);
  }
}
