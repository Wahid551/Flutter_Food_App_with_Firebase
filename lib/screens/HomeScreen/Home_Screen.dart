import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/config/colors.dart';
import 'package:food_app/screens/HomeScreen/drwaer_side.dart';
import 'package:food_app/screens/HomeScreen/product/product-overview.dart';
import 'package:food_app/screens/HomeScreen/single_product.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
                onTap: () {},
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
            children: [
              SingleProduct(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ProductOverView(),
                    ),
                  );
                },
                productImage:
                    'https://pngimg.com/uploads/spinach/spinach_PNG10.png',
                productName: 'Wahid Ali',
              ),
              SingleProduct(
                productImage:
                    'https://pngimg.com/uploads/spinach/spinach_PNG10.png',
                productName: 'Wahid Ali',
                onTap: () {},
              ),
              SingleProduct(
                productImage:
                    'https://pngimg.com/uploads/spinach/spinach_PNG10.png',
                productName: 'Wahid Ali',
                onTap: () {},
              ),
            ],
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
                onTap: () {},
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
            children: [
              SingleProduct(
                productImage:
                    'https://pngimg.com/uploads/spinach/spinach_PNG10.png',
                productName: 'Wahid Ali',
                onTap: () {},
              ),
              SingleProduct(
                productImage:
                    'https://pngimg.com/uploads/spinach/spinach_PNG10.png',
                productName: 'Wahid Ali',
                onTap: () {},
              ),
              SingleProduct(
                productImage:
                    'https://pngimg.com/uploads/spinach/spinach_PNG10.png',
                productName: 'Wahid Ali',
                onTap: () {},
              ),
            ],
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
                onTap: () {},
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
            children: [
              SingleProduct(
                productImage:
                    'https://pngimg.com/uploads/spinach/spinach_PNG10.png',
                productName: 'Wahid Ali',
                onTap: () {},
              ),
              SingleProduct(
                productImage:
                    'https://pngimg.com/uploads/spinach/spinach_PNG10.png',
                productName: 'Wahid Ali',
                onTap: () {},
              ),
              SingleProduct(
                productImage:
                    'https://pngimg.com/uploads/spinach/spinach_PNG10.png',
                productName: 'Wahid Ali',
                onTap: () {},
              ),
            ],
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerSide(),
      appBar: AppBar(
        iconTheme: IconThemeData(color: textColor),
        title: Text(
          'Home',
          style: TextStyle(fontSize: 22.0, color: textColor),
        ),
        backgroundColor: Color(0xffd6b738),
        actions: [
          CircleAvatar(
            radius: 12.0,
            backgroundColor: primaryColor,
            child: Icon(
              Icons.search,
              size: 22.0,
              color: textColor,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: CircleAvatar(
              child: Icon(
                Icons.shop,
                size: 22.0,
                color: textColor,
              ),
              radius: 12.0,
              backgroundColor: Color(0xffd4d181),
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
