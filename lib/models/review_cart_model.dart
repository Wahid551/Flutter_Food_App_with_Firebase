class ReviewCartModel {
  late String cartId;
  late String cartImage;
  late int cartPrice;
  late String cartName;
  late int cartQuantity;
  late var cartUnit;

  ReviewCartModel({
    required this.cartId,
    required this.cartImage,
    required this.cartName,
    required this.cartPrice,
    required this.cartQuantity,
    required this.cartUnit,
  });
}
