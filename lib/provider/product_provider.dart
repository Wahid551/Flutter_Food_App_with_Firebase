import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:food_app/models/product_model.dart';

class ProductProvider with ChangeNotifier {
  List<ProductModel> herbsProduct = [];
  late ProductModel _productModel;
  fetchHerbsProduct() async {
    List<ProductModel> _newList = [];
    QuerySnapshot value =
        await FirebaseFirestore.instance.collection('HerbsProduct').get();

    value.docs.forEach(
      (element) {
        // print(element.data());
        _productModel = ProductModel(
            productName: element.get('productName'),
            productImage: element.get('productImage'),
            productPrice: element.get('productPrice'));
        _newList.add(_productModel);
      },
    );
    herbsProduct = _newList;
    notifyListeners();
  }

  List<ProductModel> get getHerbsProductList {
    return herbsProduct;
  }
}
