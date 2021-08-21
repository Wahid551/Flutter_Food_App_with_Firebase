import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/config/colors.dart';
import 'package:food_app/provider/wishList_provider.dart';
import 'package:food_app/screens/HomeScreen/review_cart/Review_Cart.dart';
import 'package:food_app/widgets/count.dart';
import 'package:provider/provider.dart';

enum SignleCharacter { fill, outline }

class ProductOverView extends StatefulWidget {
  late final String productName;
  late final String productImage;
  late final int productPrice;
  late final String productId;

  ProductOverView({
    required this.productImage,
    required this.productName,
    required this.productPrice,
    required this.productId,
  });
  @override
  _ProductOverViewState createState() => _ProductOverViewState();
}

class _ProductOverViewState extends State<ProductOverView> {
  SignleCharacter _character = SignleCharacter.fill;
  late WishListProvider wishListProvider;

  Widget bonntonNavigatorBar({
    required Color iconColor,
    required Color backgroundColor,
    required Color color,
    required String title,
    required IconData iconData,
    required void Function() onTap,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.all(20),
          color: backgroundColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                iconData,
                size: 20,
                color: iconColor,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                title,
                style: TextStyle(color: color),
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool wishListBool = false;
  getWishtListBool() {
    FirebaseFirestore.instance
        .collection("WishList")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("YourWishList")
        .doc(widget.productId)
        .get()
        .then((value) => {
              if (this.mounted)
                {
                  if (value.exists)
                    {
                      setState(
                        () {
                          wishListBool = value.get("wishList");
                        },
                      ),
                    }
                }
            });
  }

  @override
  Widget build(BuildContext context) {
    wishListProvider = Provider.of<WishListProvider>(context);
    getWishtListBool();
    return Scaffold(
      bottomNavigationBar: Row(
        children: [
          bonntonNavigatorBar(
            backgroundColor: textColor,
            color: Colors.white70,
            iconColor: Colors.grey,
            title: "Add To WishList",
            iconData:
                wishListBool == false ? Icons.favorite_outline : Icons.favorite,
            onTap: () {
              setState(() {
                wishListBool = !wishListBool;
              });
              if (wishListBool == true) {
                wishListProvider.addWishListData(
                    wishListId: widget.productId,
                    wishListName: widget.productName,
                    wishListImage: widget.productImage,
                    wishListPrice: widget.productPrice,
                    wishListQuantity: 2);
              } else {
                wishListProvider.deleteWishtList(widget.productId);
              }
            },
          ),
          bonntonNavigatorBar(
              backgroundColor: primaryColor,
              color: textColor,
              iconColor: Colors.white70,
              title: "Go To Cart",
              iconData: Icons.shop_outlined,
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ReviewCart(),
                ));
              }),
        ],
      ),
      appBar: AppBar(
        iconTheme: IconThemeData(color: textColor),
        title: Text('Product Overview'),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              width: double.infinity,
              child: Column(
                children: [
                  ListTile(
                    title: Text(widget.productName),
                    subtitle: Text('\$50'),
                  ),
                  Container(
                    height: 250.0,
                    padding: EdgeInsets.all(40.0),
                    child: Image.network(widget.productImage),
                  ),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text(
                      'Check Availability',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: textColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CircleAvatar(
                              radius: 3.0,
                              backgroundColor: Colors.green[700],
                            ),
                            Radio(
                              value: SignleCharacter.fill,
                              groupValue: _character,
                              activeColor: Colors.green[700],
                              onChanged: (value) {
                                setState(() {
                                  //  _character = value;
                                });
                              },
                            ),
                          ],
                        ),
                        Text('\$${widget.productPrice}'),

                        Count(
                          productId: widget.productId,
                          productName: widget.productName,
                          productImage: widget.productImage,
                          productPrice: widget.productPrice,
                          productUnit: '',
                        ),

                        // Container(
                        //   padding: EdgeInsets.symmetric(
                        //       horizontal: 30.0, vertical: 10.0),
                        //   decoration: BoxDecoration(
                        //     borderRadius: BorderRadius.circular(30.0),
                        //     border: Border.all(
                        //       color: Colors.grey,
                        //     ),
                        //   ),
                        //   child: Row(
                        //     mainAxisAlignment: MainAxisAlignment.center,
                        //     children: [
                        //       Icon(
                        //         Icons.add_outlined,
                        //         size: 17.0,
                        //         color: primaryColor,
                        //       ),
                        //       Text(
                        //         'ADD',
                        //         style: TextStyle(color: primaryColor),
                        //       ),
                        //     ],
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
              child: Container(
            width: double.infinity,
            padding: EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'About This Product',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  'A product description is the marketing copy that explains what a product is and why its worth purchasing. The purpose of a product description is to supply customers with important information about the features and benefits of the product so they are compelled to buy',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: textColor,
                  ),
                ),
              ],
            ),
          )),
        ],
      ),
    );
  }
}
