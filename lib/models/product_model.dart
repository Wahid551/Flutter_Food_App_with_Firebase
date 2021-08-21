class ProductModel {
  late String productName;
  late String productImage;
  late int productPrice;
  late String productId;
  late int productQuantity;
  List<dynamic> productUnit;

  ProductModel({
    required this.productName,
    required this.productImage,
    required this.productPrice,
    required this.productId,
    required this.productQuantity,
    required this.productUnit,
  });
}
