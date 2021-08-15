import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:food_app/models/product_model.dart';

class ProductProvider with ChangeNotifier {
  late ProductModel _productModel;
  late List<ProductModel> search = [];

  productsModel(QueryDocumentSnapshot element) {
    _productModel = ProductModel(
      productName: element.get('productName'),
      productImage: element.get('productImage'),
      productPrice: element.get('productPrice'),
      productId: element.get('productId'),
    );
    // add All products to list
    search.add(_productModel);
  }

  ////////Herbs Product//////////
  List<ProductModel> herbsProduct = [];
  List<ProductModel> fruitsProduct = [];

  fetchHerbsProduct() async {
    List<ProductModel> _newList = [];
    QuerySnapshot value =
        await FirebaseFirestore.instance.collection('HerbsProduct').get();

    value.docs.forEach(
      (element) {
        // print(element.data());
        productsModel(element);
        _newList.add(_productModel);
      },
    );
    herbsProduct = _newList;
    notifyListeners();
  }

  List<ProductModel> get getHerbsProductList {
    return herbsProduct;
  }

///// Fruits Product//////////////
  List<ProductModel> freshFruit = [];

  fetchFruitsProduct() async {
    List<ProductModel> _newList = [];

    QuerySnapshot value =
        await FirebaseFirestore.instance.collection('FreshFruits').get();

    value.docs.forEach(
      (element) {
        print(element.data());
        productsModel(element);
        _newList.add(_productModel);
      },
    );
    freshFruit = _newList;
    notifyListeners();
  }

  List<ProductModel> get getFreshFruitsList {
    return freshFruit;
  }

  ///// Root Products//////
  List<ProductModel> rootProduct = [];

  fetchRootsProduct() async {
    List<ProductModel> _newList = [];

    QuerySnapshot value =
        await FirebaseFirestore.instance.collection('RootProduct').get();

    value.docs.forEach(
      (element) {
        print(element.data());
        // _productModel = ProductModel(
        //     productName: element.get('productName'),
        //     productImage: element.get('productImage'),
        //     productPrice: element.get('productPrice'));
        productsModel(element);
        _newList.add(_productModel);
      },
    );
    rootProduct = _newList;
    notifyListeners();
  }

  List<ProductModel> get getRootProductList {
    return rootProduct;
  }

  ////// All Search Products ////
  List<ProductModel> get getAllSearchProductList {
    return search;
  }
}
