import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/config/colors.dart';
import 'package:food_app/provider/product_provider.dart';
import 'package:food_app/provider/user_provider.dart';
import 'package:food_app/screens/HomeScreen/drwaer_side.dart';
import 'package:food_app/screens/HomeScreen/product_overview/product-overview.dart';
import 'package:food_app/screens/HomeScreen/review_cart/Review_Cart.dart';
import 'package:food_app/screens/HomeScreen/search/search.dart';
import 'package:food_app/screens/HomeScreen/single_product.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late ProductProvider productProvider;
  Widget _buildHerbsProduct(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Herbs Seasonings',
                style: TextStyle(color: textColor),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Search(
                            search: productProvider.getHerbsProductList,
                          )));
                },
                child: Text(
                  'view all',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: productProvider.getHerbsProductList.map(
              (herbsProductData) {
                return SingleProduct(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ProductOverView(
                          productId: herbsProductData.productId,
                          productName: herbsProductData.productName,
                          productImage: herbsProductData.productImage,
                          productPrice: herbsProductData.productPrice,
                        ),
                      ),
                    );
                  },
                  productImage: herbsProductData.productImage,
                  productName: herbsProductData.productName,
                  productPrice: herbsProductData.productPrice,
                  productId: herbsProductData.productId,
                );
              },
            ).toList(),
            // children: [

            //
            // ],
          ),
        ),
      ],
    );
  }

  Widget _buildFreshProduct(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Fresh Fruits',
                style: TextStyle(color: textColor),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Search(
                            search: productProvider.getFreshFruitsList,
                          )));
                },
                child: Text(
                  'view all',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: productProvider.getFreshFruitsList.map(
              (fruitData) {
                return SingleProduct(
                  productImage: fruitData.productImage,
                  productName: fruitData.productName,
                  productPrice: fruitData.productPrice,
                  productId: fruitData.productId,
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ProductOverView(
                          productId: fruitData.productId,
                          productName: fruitData.productName,
                          productImage: fruitData.productImage,
                          productPrice: fruitData.productPrice,
                        ),
                      ),
                    );
                  },
                );
              },
            ).toList(),
            // children: [
            //   SingleProduct(
            //     productImage:
            //         'https://pngimg.com/uploads/spinach/spinach_PNG10.png',
            //     productName: 'Wahid Ali',
            //     productPrice: 20,
            //     onTap: () {},
            //   ),
            //
            // ],
          ),
        ),
      ],
    );
  }

  Widget _buildRootProduct() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Root Vegetables',
                style: TextStyle(color: textColor),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Search(
                            search: productProvider.getRootProductList,
                          )));
                },
                child: Text(
                  'view all',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: productProvider.getRootProductList.map(
              (e) {
                return SingleProduct(
                  productPrice: e.productPrice,
                  productImage: e.productImage,
                  productName: e.productName,
                  productId: e.productId,
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ProductOverView(
                          productId: e.productId,
                          productName: e.productName,
                          productImage: e.productImage,
                          productPrice: e.productPrice,
                        ),
                      ),
                    );
                  },
                );
              },
            ).toList(),
            // children: [
            //   SingleProduct(
            //     productPrice: 20,
            //     productImage:
            //         'https://pngimg.com/uploads/spinach/spinach_PNG10.png',
            //     productName: 'Wahid Ali',
            //     onTap: () {},
            //   ),
            //
            // ],
          ),
        )
      ],
    );
  }

  @override
  void initState() {
    ProductProvider productProvider = Provider.of(context, listen: false);
    productProvider.fetchHerbsProduct();
    productProvider.fetchFruitsProduct();
    productProvider.fetchRootsProduct();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    productProvider = Provider.of(context);
    UserProvider userProvider = Provider.of(context);
    userProvider.getUserData();
    return Scaffold(
      drawer: DrawerSide(userProvider: userProvider),
      appBar: AppBar(
        iconTheme: IconThemeData(color: textColor),
        title: Text(
          'Home',
          style: TextStyle(fontSize: 22.0, color: textColor),
        ),
        backgroundColor: Color(0xffd6b738),
        actions: [
          CircleAvatar(
            radius: 20.0,
            backgroundColor: Color(0xffd4d181),
            child: IconButton(
              icon: Icon(
                Icons.search,
                size: 27.0,
                color: textColor,
              ),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => Search(
                      search: productProvider.getAllSearchProductList,
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => ReviewCart()));
              },
              child: CircleAvatar(
                child: Icon(
                  Icons.shop,
                  size: 22.0,
                  color: textColor,
                ),
                radius: 20.0,
                backgroundColor: Color(0xffd4d181),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
        child: ListView(
          children: [
            Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.20,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          'https://ak.picdn.net/shutterstock/videos/5039891/thumb/1.jpg'),
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.red,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                          flex: 2,
                          child: Container(
                            //color: Colors.red,
                            child: Column(
                              children: [
                                Padding(
                                  padding:
                                      EdgeInsets.only(right: 150, bottom: 1),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Color(0xffd1ad17),
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(50.0),
                                          bottomRight: Radius.circular(50.0),
                                        )),
                                    height: 50.0,
                                    width: 100.0,
                                    child: Center(
                                      child: Text(
                                        'Vegi',
                                        style: TextStyle(
                                            fontSize: 22.0,
                                            color: Colors.white,
                                            shadows: [
                                              BoxShadow(
                                                color: Colors.green.shade800,
                                                blurRadius: 10,
                                                offset: Offset(3, 3),
                                              ),
                                            ]),
                                        //textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(right: 32),
                                  child: Text(
                                    '30% Off',
                                    style: TextStyle(
                                      fontSize: 40.0,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Text(
                                  'on all vegetables products',
                                  style: TextStyle(
                                    // fontSize: 18.0,
                                    color: Colors.white,
                                    //fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          )),
                      Expanded(
                        child: Container(),
                      )
                    ],
                  ),
                ),
                _buildHerbsProduct(context),
                _buildFreshProduct(context),
                _buildRootProduct()
              ],
            ),
          ],
        ),
      ),
    );
  }
}
