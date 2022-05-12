class ImageResponseModel {
  final String? url;

  ImageResponseModel({required this.url});

  factory ImageResponseModel.fromJson(Map<String, dynamic> json) {
    return ImageResponseModel(url: json["path"]);
  }
}

class ImageListPage<ItemType> {
  ImageListPage({
    required this.grandTotalCount,
    required this.itemList,
  });

  final int grandTotalCount;
  final List<ItemType> itemList;

  bool isLastPage(int previouslyFetchedItemsCount) {
    final newItemsCount = itemList.length;
    final totalFetchedItemsCount = previouslyFetchedItemsCount + newItemsCount;
    return totalFetchedItemsCount == grandTotalCount;
  }
}
