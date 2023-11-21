class ClothingItem {
  String image;
  String name;
  double price;
  double rating;
  int? categoryId;
  String? size;
  int? genderId;
  int? brandId;
  String? productBrandModel;
  String? model3D;

  ClothingItem({
    required this.image,
    required this.name,
    required this.price,
    this.size,
    required this.rating,
    this.brandId,
    this.categoryId,
    this.genderId,
    this.productBrandModel,
    this.model3D,
});
}
